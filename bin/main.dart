import 'dart:ffi';
import 'dart:io';

import 'package:huldra/huldra.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/schema/raw_data.dart';
import 'package:huldra/yaml_config.dart';
import 'package:injector/injector.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/open.dart';
import 'package:nyxx/nyxx.dart';
import 'package:fasttext/fasttext.dart';

// 07/01/2018

void main() async {
  // get dependency injector instance
  var injector = Injector.appInstance;

  // get base path of app binary or main.dart
  var basePath =
      Platform.script.toFilePath().endsWith('.dart')
          ? '${File.fromUri(Platform.script).parent.parent.path}/build'
          : '${File.fromUri(Platform.script).parent.path}';

  // register dependencies
  await YamlConfig.fromFile(File('$basePath/config.yaml')).then((result) {
    injector.registerSingleton<YamlConfig>(() => result);
  });

  injector.registerSingleton<RawData>(() {
    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, () {
        return DynamicLibrary.open('$basePath/sqlite3.dll');
      });
    }
    var rawDataFile = File('$basePath/rawData.sqlite');

    return RawData(NativeDatabase(rawDataFile));
  });

  injector.registerSingleton<KnowledgeBase>(() {
    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, () {
        return DynamicLibrary.open('$basePath/sqlite3.dll');
      });
    }
    var kbFile = File('$basePath/kb.sqlite');

    return KnowledgeBase(NativeDatabase(kbFile));
  });

  var _config = Injector.appInstance.get<YamlConfig>();

  if (_config.getBool('useFastText')) {
    injector.registerSingleton<FastText>(() {
      var fastTextFile = File('$basePath/fasttext.bin');
      var fasttext = FastText();
      fasttext.loadModel(fastTextFile.path);
      return fasttext;
    });
  }

  var nyxxClient = await Nyxx.connectGateway(_config.getString('discordToken'), GatewayIntents.all);

  // initialize bot
  Huldra(nyxxClient, _config.getInt('probability'), _config.getInt('ownerId'));
}
