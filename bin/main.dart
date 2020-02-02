// import 'package:huldra/config.dart';
// import 'package:huldra/huldra.dart' as huldra;
// import 'package:huldra/config.dart';
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

void main() async {
  if (Platform.script.toFilePath().endsWith('.dart')) {
    config = await YamlConfig.fromFile(
        File('${Directory.current.path}/build/config.yaml'));
  } else {
    config = await YamlConfig.fromFile(
        File('${Directory.current.path}/config.yaml'));
  }

  configureNyxxForVM();
  bot = Nyxx(config.getString('discordToken'));

  await YamlConfig.fromFile(File('config.yaml'));

  bot.onMessageReceived.listen((MessageEvent e) {
    print(e.message.content);
  });

  if (Platform.isWindows) {
    open.overrideFor(OperatingSystem.windows, () {
      if (Platform.script.toFilePath().endsWith('.dart')) {
        return DynamicLibrary.open(
            '${Directory.current.path}/build/sqlite3.dll');
      } else {
        var lib = File('${Directory.current.path}/sqlite3.dll');
        print(lib.existsSync());
        return DynamicLibrary.open(lib.path);
      }
    });
  }

  File kbFile = File('${Directory.current.path}/kb.sqlite');
  kbFile.createSync();

  var kb = tables.Knowledgebase(VmDatabase(kbFile));

  kb.allmessages.then((result) {
    print("test");
    print(result.toString());
  });

  kb
      .into(kb.messages)
      .insert(tables.MessagesCompanion(
          author: Value("Rocks25"),
          content: Value("nice"),
          timestamp: Value(DateTime.now())))
      .then((result) => print(result.toString()));

  kb.close();
}
