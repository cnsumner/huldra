import 'dart:io';

import 'package:yaml/yaml.dart';

class YamlConfig {
  final YamlMap _data;

  YamlConfig(String text) : _data = loadYaml(text) as YamlMap {
    init();
  }

  static Future<YamlConfig> fromFile(File file) {
    return file.readAsString().then((text) => YamlConfig(text));
  }

  late String discordToken;
  late int ownerId;
  late int probability;
  late bool useFastText;

  /// This helps to initialize object's properties
  ///
  /// For example, you can get rid of getter methods by initializing
  /// your own properties when configuration is loaded
  void init() {
    discordToken = getString('discordToken');
    ownerId = getInt('ownerId');
    probability = getInt('probability');
    useFastText = getBool('useFastText');
  }

  dynamic get(String key) => _data.value[key];
  String getString(String key) => _data[key].toString();
  double getDouble(String key) => double.parse(getString(key));
  int getInt(String key) => int.parse(getString(key));
  bool getBool(String key) {
    final value = get(key);
    return value == 1 || value == true || value == '1' || value == 'true';
  }
}
