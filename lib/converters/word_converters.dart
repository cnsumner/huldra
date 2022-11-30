import 'dart:convert';

import 'package:drift/drift.dart';

class StringIntMapConverter extends TypeConverter<Map<String, int>, String> {
  const StringIntMapConverter();

  @override
  Map<String, int> fromSql(String fromDb) {
    return (json.decode(fromDb) as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value as int));
  }

  @override
  String toSql(Map<String, int> value) {
    return json.encode(value);
  }
}

class IntIntMapConverter extends TypeConverter<Map<int, int>, String> {
  const IntIntMapConverter();

  @override
  Map<int, int> fromSql(String fromDb) {
    return (json.decode(fromDb) as Map<String, dynamic>)
        .map((key, value) => MapEntry(int.parse(key), value as int));
  }

  @override
  String toSql(Map<int, int> value) {
    return json
        .encode(value.map((key, value) => MapEntry(key.toString(), value)));
  }
}
