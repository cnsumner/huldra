import 'dart:ffi';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:fasttext/fasttext.dart';
import 'package:huldra/huldra.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/schema/raw_data.dart';
import 'package:huldra/yaml_config.dart';
import 'package:injector/injector.dart';
import 'package:nyxx/nyxx.dart';
import 'package:sqlite3/open.dart';

void main() async {
  // get dependency injector instance
  final injector = Injector.appInstance;

  // get base path of app binary or main.dart
  final basePath = Platform.script.toFilePath().endsWith('.dart')
      ? '${File.fromUri(Platform.script).parent.parent.path}/build'
      : File.fromUri(Platform.script).parent.path;

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
    final rawDataFile = File('$basePath/rawData.sqlite');

    return RawData(
      NativeDatabase.createInBackground(
        rawDataFile,
        setup: (db) {
          db.execute('PRAGMA journal_mode = WAL;');
        },
      ),
    );
  });

  injector.registerSingleton<KnowledgeBase>(() {
    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, () {
        return DynamicLibrary.open('$basePath/sqlite3.dll');
      });
    }
    final kbFile = File('$basePath/kb.sqlite');

    return KnowledgeBase(
      NativeDatabase.createInBackground(
        kbFile,
        setup: (db) {
          db.execute('PRAGMA journal_mode = WAL;');
          db.execute('PRAGMA foreign_keys = ON;');
        },
      ),
    );
  });

  final config = Injector.appInstance.get<YamlConfig>();

  if (config.useFastText) {
    injector.registerSingleton<FastText>(() {
      final fastTextFile = File('$basePath/fasttext.bin');
      final fasttext = FastText();
      fasttext.loadModel(fastTextFile.path);
      return fasttext;
    });
  }

  final nyxxClient = await Nyxx.connectGateway(
    config.discordToken,
    GatewayIntents.all,
    options: GatewayClientOptions(plugins: [logging, cliIntegration]),
  );

  // initialize bot
  Huldra(nyxxClient, config.probability, config.ownerId);
}
