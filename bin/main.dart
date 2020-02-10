import 'dart:ffi';
import 'dart:io';

import 'package:huldra/huldra.dart';
import 'package:huldra/tables.dart';
import 'package:injector/injector.dart';
import 'package:moor_ffi/database.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:moor_ffi/open_helper.dart';
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

  injector.registerSingleton<Knowledgebase>((_) {
    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, () {
        return DynamicLibrary.open('${basePath}/sqlite3.dll');
      });
    }
    var kbFile = File('${basePath}/kb.sqlite');

    return Knowledgebase(VmDatabase(kbFile));
  });

  // initialize bot
  var huldra = Huldra();
}
