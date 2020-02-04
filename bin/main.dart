import 'dart:ffi';
import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/database.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:huldra/tables.dart' as tables;
import 'package:moor_ffi/open_helper.dart';
import 'package:yaml_config/yaml_config.dart';

Nyxx bot;
YamlConfig config;
// 07/01/2018

void main() async {
  var basePath = Platform.script.toFilePath().endsWith('.dart')
      ? '${File.fromUri(Platform.script).parent.parent.path}/build'
      : '${File.fromUri(Platform.script).parent.path}';

  config = await YamlConfig.fromFile(File('$basePath/config.yaml'));

  bot = NyxxVm(config.getString('discordToken'));

  if (Platform.isWindows) {
    open.overrideFor(OperatingSystem.windows, () {
      return DynamicLibrary.open('${basePath}/sqlite3.dll');
    });
  }

  var kbFile = File('${basePath}/kb.sqlite');

  var kb = tables.Knowledgebase(VmDatabase(kbFile));

  bot.onMessageReceived.listen((MessageEvent e) {
    if (e.message.author.bot ||
        (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
      return;
    }

    var message = tables.Message(
        id: e.message.id.toString(),
        author: e.message.author.id.toString(),
        timestamp: e.message.createdAt,
        content: e.message.content);

    var attachments = <tables.Attachment>[];

    if (e.message.attachments.isNotEmpty) {
      e.message.attachments.forEach((id, attachment) {
        attachments.add(tables.Attachment(
            id: id.toString(),
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

    kb.insertMessage(message, attachments, messageAttachments).then(
        (result) => print('Added message ${message.id} to db.'),
        onError: (e) => print('Failed to add message to db: ${e.toString()}'));
  });

  bot.onReady.listen((data) async {
    var channel = (bot.channels
        .find((c) => c.id.id == '96407444506300416')
        .first as MessageChannel);

    var messages =
        await channel.getMessages(after: Snowflake('465587079485849610'));

    await messages.forEach((m) {
      if (m.author.bot || (m.content.isEmpty && m.attachments.isEmpty)) {
        return;
      }

      var message = tables.Message(
          id: m.id.toString(),
          author: m.author.id.toString(),
          timestamp: m.createdAt,
          content: m.content);

      var attachments = <tables.Attachment>[];

      if (m.attachments.isNotEmpty) {
        m.attachments.forEach((id, attachment) {
          attachments.add(tables.Attachment(
              id: id.toString(),
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

      kb.insertMessage(message, attachments, messageAttachments).then(
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
        },
      );
    });
  });

  // kb
  //     .into(kb.messages)
  //     .insert(tables.MessagesCompanion(
  //         author: Value("Rocks25"),
  //         content: Value("nice"),
  //         timestamp: Value(DateTime.now())))
  //     .then((result) => print(result.toString()));

  // kb.close();
}
