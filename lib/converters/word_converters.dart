import 'dart:convert';

import 'package:moor/moor.dart';

class StringIntMapConverter extends TypeConverter<Map<String, int>, String> {
  const StringIntMapConverter();

  @override
  Map<String, int> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }

    return (json.decode(fromDb) as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value as int));
  }

  @override
  String mapToSql(Map<String, int> value) {
    if (value == null) {
      return null;
    }

    return json.encode(value);
  }
}

class IntIntMapConverter extends TypeConverter<Map<int, int>, String> {
  const IntIntMapConverter();

  @override
  Map<int, int> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }

    return (json.decode(fromDb) as Map<String, dynamic>)
        .map((key, value) => MapEntry(int.parse(key), value as int));
  }

  @override
  String mapToSql(Map<int, int> value) {
    if (value == null) {
      return null;
    }

    return json
        .encode(value.map((key, value) => MapEntry(key.toString(), value)));
  }
}
