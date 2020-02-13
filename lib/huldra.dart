import 'package:injector/injector.dart';
import 'package:moor_ffi/database.dart';
import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:yaml_config/yaml_config.dart';
import 'package:huldra/tables.dart' as tables;

class Huldra {
  Nyxx bot;

  Huldra() {
    var _config = Injector.appInstance.getDependency<YamlConfig>();

    bot = NyxxVm(_config.getString('discordToken'));

    bot.onMessageReceived.listen((MessageEvent e) {
      if (e.message.content.startsWith('_') &&
          !e.message.content.startsWith('__')) {
        _processCommands(e);
        return;
      }

      if (e.message.author.bot ||
          (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
        print('Ignoring bot or empty message: ${e.message.id.id}');
        return;
      }

      _addMessage(e.message);
    });

    bot.onReady.listen((_) {
      print('Huldra is awake...');
    });

    // bot.onReady.listen((data) async {
    //   var channels = (bot.channels
    //       .find((c) => c.runtimeType == TextChannel)
    //       .toList()
    //       .cast<TextChannel>());

    //   var results = channels.map((channel) async {
    //     var messages = await (await channel.getMessages(
    //             after: Snowflake('465587079485849610')))
    //         .toList();

    //     var added = 0;
    //     var skipped = 0;

    //     await messages.forEach((m) async {
    //       if (m.author.bot || (m.content.isEmpty && m.attachments.isEmpty)) {
    //         return;
    //       }

    //       var result = await addMessage(m);

    //       if (result) {
    //         added++;
    //       } else {
    //         skipped++;
    //       }
    //     });

    //     return 'Fetching channel ${channel.name}\r\n- added $added\r\n- skipped $skipped';
    //   });

    //   (await Future.wait<String>(results)).forEach((f) => print(f));

    //   // await channels.forEach((channel) async {
    //   //   // var lastMessage = await channel.getMessages(limit: 1).first;
    //   // });
    // });
  }

  Future<bool> _addMessage(Message m) async {
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
        .getDependency<tables.Knowledgebase>()
        .insertMessage(message, attachments, messageAttachments)
        .then(
      (result) => print('Added message ${message.id} to db.'),
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
      return true;
    }
  }

  void _processCommands(MessageEvent e) {
    if (e.message.content.startsWith('_fetch') &&
        e.message.author.id.id == '96407239232884736') {
      var arguments = e.message.content.split(' ').removeAt(0);
      if (arguments.isNotEmpty) {
        switch (arguments.length) {
          case 1:
            break;
          case 2:
            break;
          default:
        }
      }
    }
  }
}
