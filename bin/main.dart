import 'dart:ffi';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:huldra/huldra.dart';
import 'package:huldra/markov/markov.dart';
import 'package:huldra/markov/word.dart';
import 'package:huldra/schema/tables.dart';
import 'package:injector/injector.dart';
import 'package:moor/ffi.dart';
import 'package:sqlite3/open.dart';
import 'package:yaml_config/yaml_config.dart';

// 07/01/2018

void main() async {
  // get dependency injector instance
  var injector = Injector.appInstance;

  // get base path of app binary or main.dart
  var basePath = Platform.script.toFilePath().endsWith('.dart')
      ? '${File.fromUri(Platform.script).parent.parent.path}/build'
      : '${File.fromUri(Platform.script).parent.path}';

  // register dependencies
  await YamlConfig.fromFile(File('$basePath/config.yaml')).then((result) {
    injector.registerSingleton<YamlConfig>((_) => result);
  });

  injector.registerSingleton<RawData>((_) {
    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, () {
        return DynamicLibrary.open('${basePath}/sqlite3.dll');
      });
    }
    var kbFile = File('${basePath}/kb.sqlite');

    return RawData(VmDatabase(kbFile));
  });

  // init Hive storage
  await Hive.init(basePath);
  Hive.registerAdapter(MarkovAdapter());
  Hive.registerAdapter(WordAdapter());

  // initialize bot
  Huldra();
}
