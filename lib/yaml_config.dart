import 'dart:io';

import 'package:yaml/yaml.dart';

class YamlConfig {
  final YamlMap _data;

  static Future<YamlConfig> fromFile(File file) {
    return file.readAsString().then((text) => YamlConfig(text));
  }

  YamlConfig(String text) : _data = loadYaml(text) {
    init();
  }

  /// This helps to initialize object's properties
  ///
  /// For example, you can get rid of getter methods by initializing
  /// your own properties when configuration is loaded
  void init() {}

  dynamic get(String key) => _data[key];
  String getString(String key) => _data[key].toString();
  double getDouble(String key) => double.parse(getString(key));
  int getInt(String key) => int.parse(getString(key));
  bool getBool(String key) {
    var value = get(key);
    return value == 1 || value == true || value == '1' || value == 'true';
  }
}
