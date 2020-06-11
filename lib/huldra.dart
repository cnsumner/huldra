import 'dart:math';

import 'package:hive/hive.dart';
import 'package:huldra/markov/markov.dart';
import 'package:huldra/markov/word.dart';
import 'package:injector/injector.dart';
import 'package:moor_ffi/database.dart';
import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:yaml_config/yaml_config.dart';
import 'package:huldra/schema/tables.dart' as tables;

class Huldra {
  Nyxx bot;

  Huldra() {
    var _config = Injector.appInstance.getDependency<YamlConfig>();

    bot = NyxxVm(_config.getString('discordToken'));

    bot.onMessageReceived.listen((MessageEvent e) async {
      if (e.message.author.bot ||
          (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
        print('Ignoring bot or empty message: ${e.message.id.id}');
      } else if (e.message.content.startsWith('_') &&
          !e.message.content.startsWith('__')) {
        _processCommands(e);
      } else {
        await _addMessage(e.message).whenComplete(() async {
          // if (e.message.channel.id.id == '196706413169344512') {
          var metadata = Hive.box('metadata');
          Markov markov = metadata.get('markov');

          if (markov == null) {
            markov = Markov();
            await metadata.put('markov', markov);
          }

          var reply = markov.generate(
              e.message.content.split(' ')..removeWhere((word) => word == ''));

          await e.message.reply(content: reply, mention: false);
          // }
        });
      }
    });

    bot.onReady.listen((_) {
      print('Huldra is awake...');
    });

    Hive.openBox('metadata').then((_) => print('Metadata loaded.'));
    Hive.openBox<Word>('kb',
            compactionStrategy: (entries, deleted) => deleted > 100)
        .then((_) => print('Knowledgebase loaded.'));
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
      var metadata = Hive.box('metadata');
      Markov markov = metadata.get('markov');

      if (markov == null) {
        markov = Markov();
        await metadata.put('markov', markov);
      }

      markov
          .train(message.content.split(' ')..removeWhere((word) => word == ''));

      await markov.save();

      print('and trained.');

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
        e.message.reply(content: _query(arguments[0]), mention: false);
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
      messages.forEach((m) => _addMessage(m));
      print('Fetched ${messages.length} messages from channel ${channel.name}');
    }

    print('Fetched all $countAdded messages from ${channels.length} channels.');
  }

  void _trainAll() async {
    var metadata = Hive.box('metadata');
    var kb = Hive.box<Word>('kb');

    await metadata.clear();
    await kb.clear();

    var markov = Markov();
    await metadata.put('markov', markov);

    var messages =
        await Injector.appInstance.getDependency<tables.RawData>().allMessages;

    for (var message in messages) {
      var words = message.content.split(' ')..removeWhere((word) => word == '');

      markov.train(words);
    }

    await markov.save();

    print(
        'Trained on ${markov.wordCount} words from ${markov.msgCount} messages');

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

  String _query(String word) {
    var kb = Hive.box<Word>('kb');

    var words = kb.values
        .where((value) => value.word.toLowerCase() == word.toLowerCase());

    return 'Results:' + words.map((word) => word.toString()).join();
  }
}
