import 'dart:math';

import 'package:huldra/markov/markov.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/yaml_config.dart';
import 'package:injector/injector.dart';
import 'package:drift/native.dart';
import 'package:nyxx/nyxx.dart';
import 'package:huldra/schema/raw_data.dart' as tables;
import 'package:huldra/extensions/word_extensions.dart';

class Huldra {
  late INyxxWebsocket bot;
  late int probability;
  late int ownerId;

  Huldra() {
    var _config = Injector.appInstance.get<YamlConfig>();

    bot = NyxxFactory.createNyxxWebsocket(
        _config.getString('discordToken'), GatewayIntents.all)
      ..connect();
    probability = _config.getInt('probability');
    ownerId = _config.getInt('ownerId');

    var kb = Injector.appInstance.get<KnowledgeBase>();

    bot.eventsWs.onMessageReceived.listen((IMessageReceivedEvent e) async {
      // ignore bot messages and empty messages
      if (e.message.author.bot ||
          (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
        print('Ignoring bot or empty message: ${e.message.id.id}');
      }
      // process commands
      else if (e.message.content.startsWith('_') &&
          !e.message.content.startsWith('__')) {
        await _processCommands(e);
      }
      // process bot mentions
      else if (e.message.mentions
          .where((mention) => mention.id.id == bot.self.id.id)
          .isNotEmpty) {
        await _addMessage(e.message, e.message.guild?.id)
            .whenComplete(() async {
          var input = e.message.content.split(' ')
            ..removeAt(0)
            ..removeWhere((word) => word == '');

          var reply = (await Markov.generate(input))
              .replaceAll('<@!${bot.self.id.id}>', '')
              .replaceAll('<@${bot.self.id.id}>', '')
              .trim();

          if (reply.compareTo(input.join(' ').trim()) == 0) {
            reply = await Markov.generate([]);
          }

          await (await e.message.channel.getOrDownload())
              .sendMessage(MessageBuilder.content(reply));
          print('sent $reply');
        }).catchError((error) {
          print(error);
        });
      }
      // default case. respond normally
      else {
        await _addMessage(e.message, e.message.guild?.id)
            .whenComplete(() async {
          var rand = Random(DateTime.now().millisecondsSinceEpoch);

          if ((rand.nextInt(probability) + 1) == probability) {
            var reply = (await Markov.generate(e.message.content.split(' ')
                  ..removeWhere((word) => word == '')))
                .trim();

            if (reply.compareTo(e.message.content) != 0) {
              await (await e.message.channel.getOrDownload())
                  .sendMessage(MessageBuilder.content(reply));
            } else {
              reply = await Markov.generate([]);
              await (await e.message.channel.getOrDownload())
                  .sendMessage(MessageBuilder.content(reply));
            }
          }
        });
      }
    });

    bot.onReady.listen((_) {
      print('Huldra is awake...');
    });

    kb.getMetadata().then(
        (value) => print('Metadata loaded with ${value.wordCount} words.'));
    kb
        .countWords()
        .getSingle()
        .then((value) => print('Knowledgebase loaded with $value words.'));
  }

  Future<bool> _addMessage(IMessage m, Snowflake? guildId,
      {bool printDebugLogs = true}) async {
    if (m.author.bot) {
      _printLogIf('Skipping message ${m.id.id}: bot message ', printDebugLogs);
      return false;
    }

    if (guildId == null) {
      print(
          "Skipping message ${m.id.id}: guild is null. this probably shouldn't happen");
      return false;
    }

    if (!_channelTypeValid(await m.channel.getOrDownload())) {
      print(
          'Skipping message ${m.id.id}: message not from text channel or thread. Channel id: ${m.channel.id.id}');
      return false;
    }

    var message = tables.Message(
        id: m.id.toString(),
        guild: guildId.id.toString(),
        channel: m.channel.id.toString(),
        author: m.author.id.toString(),
        timestamp: m.createdAt,
        content: m.content);

    var attachments = <tables.Attachment>[];

    if (m.attachments.isNotEmpty) {
      m.attachments.forEach((attachment) {
        attachments.add(tables.Attachment(
            id: attachment.id.toString(),
            guild: guildId.id.toString(),
            channel: m.channel.id.toString(),
            url: attachment.url,
            filename: attachment.filename));
      });
    }

    var messageAttachments = <tables.MessageAttachment>[];

    if (attachments.isNotEmpty) {
      attachments.forEach((attachment) {
        messageAttachments.add(tables.MessageAttachment(
            attachmentId: attachment.id, messageId: message.id));
      });
    }

    var error = false;

    await Injector.appInstance
        .get<tables.RawData>()
        .insertMessage(message, attachments, messageAttachments)
        .then(
      (result) {
        _printLogIf('Added message ${message.id} to db...', printDebugLogs);
      },
      onError: (e) {
        if (e.runtimeType == SqliteException &&
            (e as SqliteException)
                .message
                .contains('UNIQUE constraint failed: messages.id')) {
          _printLogIf('Skipping message already in db', printDebugLogs);
        } else {
          print('Failed to add message to db: ${e.toString()}');
        }
        error = true;
      },
    );

    if (error) {
      return false;
    } else {
      var kb = Injector.appInstance.get<KnowledgeBase>();
      var metadata = await kb.getMetadata();
      var wordMap = <String, Word>{};
      metadata = await Markov.train(
          metadata,
          wordMap,
          message.content.replaceFirst('<@!${bot.self.id.id}>', '').split(' ')
            ..removeWhere((word) => word == ''));

      await kb.updateMetadata(metadata);
      await kb.updateWords(wordMap.entries
          .map<Word>((entry) => entry.value)
          .toList(growable: false));

      return true;
    }
  }

  Future<void> _processCommands(IMessageReceivedEvent e) async {
    if (e.message.content.startsWith('_fetch') &&
        e.message.author.id.id == ownerId) {
      var arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty && e.message.guild != null) {
        _fetchMessages(e.message.guild!.id, Snowflake(arguments[0]));
      } else {
        // reply with error
      }
    } else if (e.message.content.startsWith('_trainall') &&
        e.message.author.id.id == ownerId) {
      _trainAll();
    } else if (e.message.content.startsWith('_query')) {
      var arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty && arguments.length == 1) {
        await _query(arguments[0]).then((value) async {
          await (await e.message.channel.getOrDownload())
              .sendMessage(MessageBuilder.content(value));
        });
      } else {
        await (await e.message.channel.getOrDownload()).sendMessage(
            MessageBuilder.content('Word not specified. Usage: _query [word]'));
      }
    }
  }

  void _fetchMessages(Snowflake guildId, Snowflake starId) async {
    print('Fetching messages after ${starId.id}');

    var guild = await bot.fetchGuild(guildId);

    var botMember = await guild.fetchMember(bot.appId);

    var channels =
        guild.channels.where((channel) => _channelTypeValid(channel));

    var countAdded = 0;

    for (var channel in channels) {
      if (!(await channel.effectivePermissions(botMember)).readMessageHistory) {
        print("Skipping channel we don't have read permissions for");
        continue;
      }

      var messages = <IMessage>[];
      var lastId = starId;

      while (true) {
        var messageSubset = await channel.client.httpEndpoints
            .downloadMessages(channel.id, limit: 100, after: lastId)
            .toList();
        messageSubset.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        messages.addAll(messageSubset);

        if (messageSubset.isEmpty) {
          break;
        }

        lastId = messageSubset.last.id;

        print(
            'Fetched ${countAdded + messages.length} messages up to ${messageSubset.last.createdAt}...');
        await Future.delayed(Duration(milliseconds: 300));

        if (messages.length >= 5000) {
          print('Buffer full, writing 10k messages to db.');

          var results = await Future.wait(messages.map<Future<bool>>(
              (m) => _addMessage(m, guild.id, printDebugLogs: false)));

          countAdded += results.where((r) => true).length;
          messages.clear();
        }
      }

      var results = await Future.wait(messages.map<Future<bool>>(
          (m) => _addMessage(m, guild.id, printDebugLogs: false)));

      countAdded += results.where((r) => true).length;

      print('Fetched ${messages.length} messages from channel ${channel.name}');
    }

    print('Fetched all $countAdded messages from ${channels.length} channels.');
  }

  void _trainAll() async {
    // var metadata = Hive.box('metadata');
    // var kb = Hive.box<Word>('kb');

    // await metadata.clear();
    // await kb.clear();

    // var markov = Markov();
    // await metadata.put('markov', markov);

    // var messages =
    //     await Injector.appInstance.getDependency<tables.RawData>().allMessages;

    // for (var message in messages) {
    //   var words = message.content.split(' ')..removeWhere((word) => word == '');

    //   markov.train(words);
    // }

    // await markov.save();

    // print(
    //     'Trained on ${markov.wordCount} words from ${markov.msgCount} messages');

    var kb = Injector.appInstance.get<KnowledgeBase>();

    await kb.clearKnowledgeBase();

    var count = 0;

    var pageSize = 1000;

    var messages = await Injector.appInstance
        .get<tables.RawData>()
        .getPagedMessages(pageSize);

    var stopwatch = Stopwatch();
    var lastFreq;
    var performanceBias = 0;
    var direction = 1;

    while (messages.isNotEmpty) {
      stopwatch.reset();
      stopwatch.start();
      var metadata = await kb.getMetadata();
      var wordMap = <String, Word>{};

      for (var message in messages) {
        var tokens = message.content
            .replaceFirst('<@!${bot.self.id.id}>', '')
            .split(' ')
          ..removeWhere((token) => token == '');

        metadata = await Markov.train(metadata, wordMap, tokens);
      }

      await kb.updateWords(wordMap.entries
          .map<Word>((entry) => entry.value)
          .toList(growable: false));

      await kb.updateMetadata(metadata);

      // await Future.delayed(Duration(milliseconds: 100));

      count += messages.length;

      print('Trained ${metadata.wordCount} words from $count messages');

      var msgCount = messages.length;

      messages = await Injector.appInstance
          .get<tables.RawData>()
          .getPagedMessages(pageSize, lastId: messages.last.id);

      stopwatch.stop();

      var freq = msgCount / stopwatch.elapsedMilliseconds;

      if (lastFreq == null) {
        lastFreq = freq;
        continue;
      } else {
        if (lastFreq > freq) {
          // slowing down...
          performanceBias -= performanceBias > -10 ? 1 : 0;
        } else if (lastFreq < freq) {
          // speeding up!
          performanceBias += performanceBias < 2 ? 2 : 0;
        }

        direction *= performanceBias.sign == 0 ? 1 : performanceBias.sign;
        print('Frequency: ${freq * 1000} msgs/s');
        print('Performance bias: $performanceBias');

        if ((pageSize < 2000 && direction > 0) ||
            (pageSize > 100 && direction < 0)) {
          pageSize += 100 * direction;
          print('Changing page size to $pageSize');
        }

        lastFreq = freq;
      }
    }

    await kb.getMetadata().then((value) => print(
        'Trained on ${value.wordCount} words from ${value.msgCount} messages'));

    await kb
        .countWords()
        .getSingle()
        .then((value) => print('Kb now contains $value words'));

    // var words =
    //     messages.map((m) => m.content.split(' ')).expand((w) => w).toList();

    // var wordCounts = <String, int>{};

    // for (var word in words) {
    //   if (word != '') {
    //     if (wordCounts.containsKey(word)) {
    //       wordCounts[word] += 1;
    //     } else {
    //       wordCounts[word] = 1;
    //     }
    //   }
    // }

    // var mostCommon = wordCounts.entries.toList()
    //   ..sort((a, b) => b.value.compareTo(a.value));

    // print(
    //     'Extracted ${wordCounts.length} words from ${messages.length} messages');

    // var top50 =
    //     mostCommon.getRange(0, 50).map((m) => '${m.key}: ${m.value}').toList();

    // top50.forEach((w) => print(w));
  }

  Future<String> _query(String word) async {
    var kb = Injector.appInstance.get<KnowledgeBase>();

    var words = await kb.queryWords(word);

    var results = await Future.wait(words.map<Future<String>>((word) {
      return word.toFormattedString();
    }));

    var formattedResults = results.join();

    return 'Results: $formattedResults';
  }

  bool _channelTypeValid(IChannel channel) {
    return <ChannelType>[
      ChannelType.text,
      ChannelType.guildPublicThread,
      ChannelType.guildPrivateThread
    ].contains(channel.channelType);
  }

  void _printLogIf(String message, bool shouldLog) {
    if (shouldLog) {
      print(message);
    }
  }
}
