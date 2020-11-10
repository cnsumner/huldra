import 'dart:math';

import 'package:huldra/markov/markov.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:injector/injector.dart';
import 'package:moor/ffi.dart';
import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:yaml_config/yaml_config.dart';
import 'package:huldra/schema/raw_data.dart' as tables;
import 'package:huldra/extensions/word_extensions.dart';

class Huldra {
  Nyxx bot;
  int probability;

  Huldra() {
    var _config = Injector.appInstance.getDependency<YamlConfig>();

    bot = NyxxVm(_config.getString('discordToken'));
    probability = _config.getInt('probability');

    var kb = Injector.appInstance.getDependency<KnowledgeBase>();

    bot.onMessageReceived.listen((MessageEvent e) async {
      if (e.message.author.bot ||
          (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
        print('Ignoring bot or empty message: ${e.message.id.id}');
      } else if (e.message.content.startsWith('_') &&
          !e.message.content.startsWith('__')) {
        _processCommands(e);
      } else if (e.message.content.startsWith('<@!674451490743779339>')) {
        await _addMessage(e.message).whenComplete(() async {
          var input = e.message.content.split(' ')
            ..removeAt(0)
            ..removeWhere((word) => word == '');

          var reply = (await Markov.generate(input))
              .replaceAll('<@!674451490743779339>', '')
              .trim();

          if (reply.compareTo(input.join(' ').trim()) == 0) {
            reply = await Markov.generate([]);
          }

          await e.message.reply(content: reply, mention: false);
        }).catchError((error) => print(error));
      } else {
        await _addMessage(e.message).whenComplete(() async {
          var rand = Random(DateTime.now().millisecondsSinceEpoch);

          if ((rand.nextInt(probability) + 1) == probability) {
            var reply = (await Markov.generate(e.message.content.split(' ')
                  ..removeWhere((word) => word == '')))
                .trim();

            if (reply.compareTo(e.message.content) != 0) {
              await e.message.reply(content: reply, mention: false);
            } else {
              reply = await Markov.generate([]);
              await e.message.reply(content: reply, mention: false);
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
        .then((value) => print('Knowledgebase loaded with ${value} words.'));
  }

  Future<bool> _addMessage(Message m) async {
    if (m.author.bot) {
      print('Skipping bot message ${m.id.id}');
      return false;
    }

    var message = tables.Message(
        id: m.id.toString(),
        guild: m.guild.id.toString(),
        channel: m.channel.id.toString(),
        author: m.author.id.toString(),
        timestamp: m.createdAt,
        content: m.content);

    var attachments = <tables.Attachment>[];

    if (m.attachments.isNotEmpty) {
      m.attachments.forEach((id, attachment) {
        attachments.add(tables.Attachment(
            id: id.toString(),
            guild: m.guild.id.toString(),
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
        .getDependency<tables.RawData>()
        .insertMessage(message, attachments, messageAttachments)
        .then(
      (result) => print('Added message ${message.id} to db...'),
      onError: (e) {
        if (e.runtimeType == SqliteException &&
            (e as SqliteException)
                .message
                .contains('UNIQUE constraint failed: messages.id')) {
          print('Skipping message already in db');
        } else {
          print('Failed to add message to db: ${e.toString()}');
        }
        error = true;
      },
    );

    if (error) {
      return false;
    } else {
      var kb = Injector.appInstance.getDependency<KnowledgeBase>();
      var metadata = await kb.getMetadata();
      var wordMap = <String, Word>{};
      metadata = await Markov.train(
          metadata,
          wordMap,
          message.content.replaceFirst('<@!674451490743779339>', '').split(' ')
            ..removeWhere((word) => word == ''));

      await kb.updateMetadata(metadata);
      await kb.updateWords(wordMap.entries
          .where((element) => element.key != null)
          .map<Word>((entry) => entry.value)
          .toList(growable: false));

      return true;
    }
  }

  void _processCommands(MessageEvent e) {
    if (e.message.content.startsWith('_fetch') &&
        e.message.author.id.id == '96407239232884736') {
      var arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty) {
        _fetchMessages(Snowflake(arguments[0]));
      } else {
        // reply with error
      }
    } else if (e.message.content.startsWith('_trainall') &&
        e.message.author.id.id == '96407239232884736') {
      _trainAll();
    } else if (e.message.content.startsWith('_query')) {
      var arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty && arguments.length == 1) {
        _query(arguments[0]).then((value) {
          e.message.reply(content: value, mention: false);
        });
      } else {
        e.message.reply(
          content: 'Word not specified. Usage: _query [word]',
          mention: false,
        );
      }
    }
  }

  void _fetchMessages(Snowflake from) async {
    print('Fetching messages after ${from.id}');
    var channels = (bot.channels
        .find((c) => c.runtimeType == TextChannel)
        .toList()
        .cast<TextChannel>());

    var countAdded = 0;

    for (var i = 0; i < channels.length; i++) {
      var channel = channels[i];
      var to = (await channel.getMessages(limit: 1).first)?.id;
      var messages = <Message>[];
      var lastId = from;

      if (to != null) {
        while (true) {
          var messageSubset =
              await channel.getMessages(limit: 100, after: lastId).toList();
          messageSubset.sort((a, b) => a.createdAt.compareTo(b.createdAt));
          messages.addAll(messageSubset);

          if (messageSubset.firstWhere(
                    (m) => m.id == to,
                    orElse: () => null,
                  ) !=
                  null ||
              messageSubset.isEmpty) {
            break;
          }

          lastId = messageSubset.last.id;

          print(
              'Fetched ${countAdded + messages.length} messages up to ${messageSubset.last.createdAt}...');
          await Future.delayed(Duration(milliseconds: 300));

          if (messages.length >= 10000) {
            print('Buffer full, writing 10k messages to db.');

            for (var m = 0; m < messages.length; m++) {
              await _addMessage(messages[m]);
            }

            countAdded += messages.length;
            messages.clear();
          }
        }
      }

      countAdded += messages.length;
      await Future.wait(messages.map<Future<bool>>((m) => _addMessage(m)));

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

    var kb = Injector.appInstance.getDependency<KnowledgeBase>();

    await kb.clearKnowledgeBase();

    var count = 0;

    var pageSize = 1000;

    var messages = await Injector.appInstance
        .getDependency<tables.RawData>()
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
            .replaceFirst('<@!674451490743779339>', '')
            .split(' ')
              ..removeWhere((token) => token == '');

        metadata = await Markov.train(metadata, wordMap, tokens);
      }

      await kb.updateWords(wordMap.entries
          .where((element) => element.key != null)
          .map<Word>((entry) => entry.value)
          .toList(growable: false));

      await kb.updateMetadata(metadata);

      // await Future.delayed(Duration(milliseconds: 100));

      count += messages.length;

      print('Trained ${metadata.wordCount} words from ${count} messages');

      var msgCount = messages.length;

      messages = await Injector.appInstance
          .getDependency<tables.RawData>()
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
        .then((value) => print('Kb now contains ${value} words'));

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
    var kb = Injector.appInstance.getDependency<KnowledgeBase>();

    var words = await kb.queryWords(word);

    var results = await Future.wait(words.map<Future<String>>((word) {
      return word.toFormattedString();
    }));

    var formattedResults = results.join();

    return 'Results: $formattedResults';
  }
}
