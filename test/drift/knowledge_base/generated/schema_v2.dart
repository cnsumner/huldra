// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Words extends Table with TableInfo<Words, WordsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Words(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> totalOccurances = GeneratedColumn<int>(
    'total_occurances',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> msgOccurances = GeneratedColumn<int>(
    'msg_occurances',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    wordHash,
    word,
    totalOccurances,
    msgOccurances,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash};
  @override
  WordsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordsData(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      totalOccurances: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_occurances'],
      )!,
      msgOccurances: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}msg_occurances'],
      )!,
    );
  }

  @override
  Words createAlias(String alias) {
    return Words(attachedDatabase, alias);
  }
}

class WordsData extends DataClass implements Insertable<WordsData> {
  final String wordHash;
  final String word;
  final int totalOccurances;
  final int msgOccurances;
  const WordsData({
    required this.wordHash,
    required this.word,
    required this.totalOccurances,
    required this.msgOccurances,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['word'] = Variable<String>(word);
    map['total_occurances'] = Variable<int>(totalOccurances);
    map['msg_occurances'] = Variable<int>(msgOccurances);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      wordHash: Value(wordHash),
      word: Value(word),
      totalOccurances: Value(totalOccurances),
      msgOccurances: Value(msgOccurances),
    );
  }

  factory WordsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordsData(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      word: serializer.fromJson<String>(json['word']),
      totalOccurances: serializer.fromJson<int>(json['totalOccurances']),
      msgOccurances: serializer.fromJson<int>(json['msgOccurances']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordHash': serializer.toJson<String>(wordHash),
      'word': serializer.toJson<String>(word),
      'totalOccurances': serializer.toJson<int>(totalOccurances),
      'msgOccurances': serializer.toJson<int>(msgOccurances),
    };
  }

  WordsData copyWith({
    String? wordHash,
    String? word,
    int? totalOccurances,
    int? msgOccurances,
  }) => WordsData(
    wordHash: wordHash ?? this.wordHash,
    word: word ?? this.word,
    totalOccurances: totalOccurances ?? this.totalOccurances,
    msgOccurances: msgOccurances ?? this.msgOccurances,
  );
  WordsData copyWithCompanion(WordsCompanion data) {
    return WordsData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      word: data.word.present ? data.word.value : this.word,
      totalOccurances: data.totalOccurances.present
          ? data.totalOccurances.value
          : this.totalOccurances,
      msgOccurances: data.msgOccurances.present
          ? data.msgOccurances.value
          : this.msgOccurances,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordsData(')
          ..write('wordHash: $wordHash, ')
          ..write('word: $word, ')
          ..write('totalOccurances: $totalOccurances, ')
          ..write('msgOccurances: $msgOccurances')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(wordHash, word, totalOccurances, msgOccurances);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsData &&
          other.wordHash == this.wordHash &&
          other.word == this.word &&
          other.totalOccurances == this.totalOccurances &&
          other.msgOccurances == this.msgOccurances);
}

class WordsCompanion extends UpdateCompanion<WordsData> {
  final Value<String> wordHash;
  final Value<String> word;
  final Value<int> totalOccurances;
  final Value<int> msgOccurances;
  final Value<int> rowid;
  const WordsCompanion({
    this.wordHash = const Value.absent(),
    this.word = const Value.absent(),
    this.totalOccurances = const Value.absent(),
    this.msgOccurances = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsCompanion.insert({
    required String wordHash,
    required String word,
    required int totalOccurances,
    required int msgOccurances,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       word = Value(word),
       totalOccurances = Value(totalOccurances),
       msgOccurances = Value(msgOccurances);
  static Insertable<WordsData> custom({
    Expression<String>? wordHash,
    Expression<String>? word,
    Expression<int>? totalOccurances,
    Expression<int>? msgOccurances,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (word != null) 'word': word,
      if (totalOccurances != null) 'total_occurances': totalOccurances,
      if (msgOccurances != null) 'msg_occurances': msgOccurances,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsCompanion copyWith({
    Value<String>? wordHash,
    Value<String>? word,
    Value<int>? totalOccurances,
    Value<int>? msgOccurances,
    Value<int>? rowid,
  }) {
    return WordsCompanion(
      wordHash: wordHash ?? this.wordHash,
      word: word ?? this.word,
      totalOccurances: totalOccurances ?? this.totalOccurances,
      msgOccurances: msgOccurances ?? this.msgOccurances,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordHash.present) {
      map['word_hash'] = Variable<String>(wordHash.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (totalOccurances.present) {
      map['total_occurances'] = Variable<int>(totalOccurances.value);
    }
    if (msgOccurances.present) {
      map['msg_occurances'] = Variable<int>(msgOccurances.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('wordHash: $wordHash, ')
          ..write('word: $word, ')
          ..write('totalOccurances: $totalOccurances, ')
          ..write('msgOccurances: $msgOccurances, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Prefixes extends Table with TableInfo<Prefixes, PrefixesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Prefixes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<String> prefixHash = GeneratedColumn<String>(
    'prefix_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [wordHash, prefixHash, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prefixes';
  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, prefixHash};
  @override
  PrefixesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrefixesData(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      prefixHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefix_hash'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  Prefixes createAlias(String alias) {
    return Prefixes(attachedDatabase, alias);
  }
}

class PrefixesData extends DataClass implements Insertable<PrefixesData> {
  final String wordHash;
  final String prefixHash;
  final int count;
  const PrefixesData({
    required this.wordHash,
    required this.prefixHash,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['prefix_hash'] = Variable<String>(prefixHash);
    map['count'] = Variable<int>(count);
    return map;
  }

  PrefixesCompanion toCompanion(bool nullToAbsent) {
    return PrefixesCompanion(
      wordHash: Value(wordHash),
      prefixHash: Value(prefixHash),
      count: Value(count),
    );
  }

  factory PrefixesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrefixesData(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      prefixHash: serializer.fromJson<String>(json['prefixHash']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordHash': serializer.toJson<String>(wordHash),
      'prefixHash': serializer.toJson<String>(prefixHash),
      'count': serializer.toJson<int>(count),
    };
  }

  PrefixesData copyWith({String? wordHash, String? prefixHash, int? count}) =>
      PrefixesData(
        wordHash: wordHash ?? this.wordHash,
        prefixHash: prefixHash ?? this.prefixHash,
        count: count ?? this.count,
      );
  PrefixesData copyWithCompanion(PrefixesCompanion data) {
    return PrefixesData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      prefixHash: data.prefixHash.present
          ? data.prefixHash.value
          : this.prefixHash,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrefixesData(')
          ..write('wordHash: $wordHash, ')
          ..write('prefixHash: $prefixHash, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(wordHash, prefixHash, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrefixesData &&
          other.wordHash == this.wordHash &&
          other.prefixHash == this.prefixHash &&
          other.count == this.count);
}

class PrefixesCompanion extends UpdateCompanion<PrefixesData> {
  final Value<String> wordHash;
  final Value<String> prefixHash;
  final Value<int> count;
  final Value<int> rowid;
  const PrefixesCompanion({
    this.wordHash = const Value.absent(),
    this.prefixHash = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrefixesCompanion.insert({
    required String wordHash,
    required String prefixHash,
    required int count,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       prefixHash = Value(prefixHash),
       count = Value(count);
  static Insertable<PrefixesData> custom({
    Expression<String>? wordHash,
    Expression<String>? prefixHash,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (prefixHash != null) 'prefix_hash': prefixHash,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrefixesCompanion copyWith({
    Value<String>? wordHash,
    Value<String>? prefixHash,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return PrefixesCompanion(
      wordHash: wordHash ?? this.wordHash,
      prefixHash: prefixHash ?? this.prefixHash,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordHash.present) {
      map['word_hash'] = Variable<String>(wordHash.value);
    }
    if (prefixHash.present) {
      map['prefix_hash'] = Variable<String>(prefixHash.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrefixesCompanion(')
          ..write('wordHash: $wordHash, ')
          ..write('prefixHash: $prefixHash, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Suffixes extends Table with TableInfo<Suffixes, SuffixesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Suffixes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<String> suffixHash = GeneratedColumn<String>(
    'suffix_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [wordHash, suffixHash, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suffixes';
  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, suffixHash};
  @override
  SuffixesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SuffixesData(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      suffixHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suffix_hash'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  Suffixes createAlias(String alias) {
    return Suffixes(attachedDatabase, alias);
  }
}

class SuffixesData extends DataClass implements Insertable<SuffixesData> {
  final String wordHash;
  final String suffixHash;
  final int count;
  const SuffixesData({
    required this.wordHash,
    required this.suffixHash,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['suffix_hash'] = Variable<String>(suffixHash);
    map['count'] = Variable<int>(count);
    return map;
  }

  SuffixesCompanion toCompanion(bool nullToAbsent) {
    return SuffixesCompanion(
      wordHash: Value(wordHash),
      suffixHash: Value(suffixHash),
      count: Value(count),
    );
  }

  factory SuffixesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SuffixesData(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      suffixHash: serializer.fromJson<String>(json['suffixHash']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordHash': serializer.toJson<String>(wordHash),
      'suffixHash': serializer.toJson<String>(suffixHash),
      'count': serializer.toJson<int>(count),
    };
  }

  SuffixesData copyWith({String? wordHash, String? suffixHash, int? count}) =>
      SuffixesData(
        wordHash: wordHash ?? this.wordHash,
        suffixHash: suffixHash ?? this.suffixHash,
        count: count ?? this.count,
      );
  SuffixesData copyWithCompanion(SuffixesCompanion data) {
    return SuffixesData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      suffixHash: data.suffixHash.present
          ? data.suffixHash.value
          : this.suffixHash,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SuffixesData(')
          ..write('wordHash: $wordHash, ')
          ..write('suffixHash: $suffixHash, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(wordHash, suffixHash, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SuffixesData &&
          other.wordHash == this.wordHash &&
          other.suffixHash == this.suffixHash &&
          other.count == this.count);
}

class SuffixesCompanion extends UpdateCompanion<SuffixesData> {
  final Value<String> wordHash;
  final Value<String> suffixHash;
  final Value<int> count;
  final Value<int> rowid;
  const SuffixesCompanion({
    this.wordHash = const Value.absent(),
    this.suffixHash = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuffixesCompanion.insert({
    required String wordHash,
    required String suffixHash,
    required int count,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       suffixHash = Value(suffixHash),
       count = Value(count);
  static Insertable<SuffixesData> custom({
    Expression<String>? wordHash,
    Expression<String>? suffixHash,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (suffixHash != null) 'suffix_hash': suffixHash,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuffixesCompanion copyWith({
    Value<String>? wordHash,
    Value<String>? suffixHash,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return SuffixesCompanion(
      wordHash: wordHash ?? this.wordHash,
      suffixHash: suffixHash ?? this.suffixHash,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordHash.present) {
      map['word_hash'] = Variable<String>(wordHash.value);
    }
    if (suffixHash.present) {
      map['suffix_hash'] = Variable<String>(suffixHash.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuffixesCompanion(')
          ..write('wordHash: $wordHash, ')
          ..write('suffixHash: $suffixHash, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HeadDistances extends Table
    with TableInfo<HeadDistances, HeadDistancesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HeadDistances(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [wordHash, distance, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'head_distances';
  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, distance};
  @override
  HeadDistancesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeadDistancesData(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distance'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  HeadDistances createAlias(String alias) {
    return HeadDistances(attachedDatabase, alias);
  }
}

class HeadDistancesData extends DataClass
    implements Insertable<HeadDistancesData> {
  final String wordHash;
  final int distance;
  final int count;
  const HeadDistancesData({
    required this.wordHash,
    required this.distance,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['distance'] = Variable<int>(distance);
    map['count'] = Variable<int>(count);
    return map;
  }

  HeadDistancesCompanion toCompanion(bool nullToAbsent) {
    return HeadDistancesCompanion(
      wordHash: Value(wordHash),
      distance: Value(distance),
      count: Value(count),
    );
  }

  factory HeadDistancesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeadDistancesData(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      distance: serializer.fromJson<int>(json['distance']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordHash': serializer.toJson<String>(wordHash),
      'distance': serializer.toJson<int>(distance),
      'count': serializer.toJson<int>(count),
    };
  }

  HeadDistancesData copyWith({String? wordHash, int? distance, int? count}) =>
      HeadDistancesData(
        wordHash: wordHash ?? this.wordHash,
        distance: distance ?? this.distance,
        count: count ?? this.count,
      );
  HeadDistancesData copyWithCompanion(HeadDistancesCompanion data) {
    return HeadDistancesData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      distance: data.distance.present ? data.distance.value : this.distance,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeadDistancesData(')
          ..write('wordHash: $wordHash, ')
          ..write('distance: $distance, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(wordHash, distance, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeadDistancesData &&
          other.wordHash == this.wordHash &&
          other.distance == this.distance &&
          other.count == this.count);
}

class HeadDistancesCompanion extends UpdateCompanion<HeadDistancesData> {
  final Value<String> wordHash;
  final Value<int> distance;
  final Value<int> count;
  final Value<int> rowid;
  const HeadDistancesCompanion({
    this.wordHash = const Value.absent(),
    this.distance = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HeadDistancesCompanion.insert({
    required String wordHash,
    required int distance,
    required int count,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       distance = Value(distance),
       count = Value(count);
  static Insertable<HeadDistancesData> custom({
    Expression<String>? wordHash,
    Expression<int>? distance,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (distance != null) 'distance': distance,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HeadDistancesCompanion copyWith({
    Value<String>? wordHash,
    Value<int>? distance,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return HeadDistancesCompanion(
      wordHash: wordHash ?? this.wordHash,
      distance: distance ?? this.distance,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordHash.present) {
      map['word_hash'] = Variable<String>(wordHash.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeadDistancesCompanion(')
          ..write('wordHash: $wordHash, ')
          ..write('distance: $distance, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TailDistances extends Table
    with TableInfo<TailDistances, TailDistancesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TailDistances(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [wordHash, distance, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tail_distances';
  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, distance};
  @override
  TailDistancesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TailDistancesData(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distance'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  TailDistances createAlias(String alias) {
    return TailDistances(attachedDatabase, alias);
  }
}

class TailDistancesData extends DataClass
    implements Insertable<TailDistancesData> {
  final String wordHash;
  final int distance;
  final int count;
  const TailDistancesData({
    required this.wordHash,
    required this.distance,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['distance'] = Variable<int>(distance);
    map['count'] = Variable<int>(count);
    return map;
  }

  TailDistancesCompanion toCompanion(bool nullToAbsent) {
    return TailDistancesCompanion(
      wordHash: Value(wordHash),
      distance: Value(distance),
      count: Value(count),
    );
  }

  factory TailDistancesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TailDistancesData(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      distance: serializer.fromJson<int>(json['distance']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordHash': serializer.toJson<String>(wordHash),
      'distance': serializer.toJson<int>(distance),
      'count': serializer.toJson<int>(count),
    };
  }

  TailDistancesData copyWith({String? wordHash, int? distance, int? count}) =>
      TailDistancesData(
        wordHash: wordHash ?? this.wordHash,
        distance: distance ?? this.distance,
        count: count ?? this.count,
      );
  TailDistancesData copyWithCompanion(TailDistancesCompanion data) {
    return TailDistancesData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      distance: data.distance.present ? data.distance.value : this.distance,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TailDistancesData(')
          ..write('wordHash: $wordHash, ')
          ..write('distance: $distance, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(wordHash, distance, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TailDistancesData &&
          other.wordHash == this.wordHash &&
          other.distance == this.distance &&
          other.count == this.count);
}

class TailDistancesCompanion extends UpdateCompanion<TailDistancesData> {
  final Value<String> wordHash;
  final Value<int> distance;
  final Value<int> count;
  final Value<int> rowid;
  const TailDistancesCompanion({
    this.wordHash = const Value.absent(),
    this.distance = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TailDistancesCompanion.insert({
    required String wordHash,
    required int distance,
    required int count,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       distance = Value(distance),
       count = Value(count);
  static Insertable<TailDistancesData> custom({
    Expression<String>? wordHash,
    Expression<int>? distance,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (distance != null) 'distance': distance,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TailDistancesCompanion copyWith({
    Value<String>? wordHash,
    Value<int>? distance,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return TailDistancesCompanion(
      wordHash: wordHash ?? this.wordHash,
      distance: distance ?? this.distance,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordHash.present) {
      map['word_hash'] = Variable<String>(wordHash.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TailDistancesCompanion(')
          ..write('wordHash: $wordHash, ')
          ..write('distance: $distance, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Meta extends Table with TableInfo<Meta, MetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Meta(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('1'),
  );
  late final GeneratedColumn<int> msgCount = GeneratedColumn<int>(
    'msg_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> wordCount = GeneratedColumn<int>(
    'word_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, msgCount, wordCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meta';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      msgCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}msg_count'],
      )!,
      wordCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word_count'],
      )!,
    );
  }

  @override
  Meta createAlias(String alias) {
    return Meta(attachedDatabase, alias);
  }
}

class MetaData extends DataClass implements Insertable<MetaData> {
  final int id;
  final int msgCount;
  final int wordCount;
  const MetaData({
    required this.id,
    required this.msgCount,
    required this.wordCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['msg_count'] = Variable<int>(msgCount);
    map['word_count'] = Variable<int>(wordCount);
    return map;
  }

  MetaCompanion toCompanion(bool nullToAbsent) {
    return MetaCompanion(
      id: Value(id),
      msgCount: Value(msgCount),
      wordCount: Value(wordCount),
    );
  }

  factory MetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MetaData(
      id: serializer.fromJson<int>(json['id']),
      msgCount: serializer.fromJson<int>(json['msgCount']),
      wordCount: serializer.fromJson<int>(json['wordCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'msgCount': serializer.toJson<int>(msgCount),
      'wordCount': serializer.toJson<int>(wordCount),
    };
  }

  MetaData copyWith({int? id, int? msgCount, int? wordCount}) => MetaData(
    id: id ?? this.id,
    msgCount: msgCount ?? this.msgCount,
    wordCount: wordCount ?? this.wordCount,
  );
  MetaData copyWithCompanion(MetaCompanion data) {
    return MetaData(
      id: data.id.present ? data.id.value : this.id,
      msgCount: data.msgCount.present ? data.msgCount.value : this.msgCount,
      wordCount: data.wordCount.present ? data.wordCount.value : this.wordCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MetaData(')
          ..write('id: $id, ')
          ..write('msgCount: $msgCount, ')
          ..write('wordCount: $wordCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, msgCount, wordCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MetaData &&
          other.id == this.id &&
          other.msgCount == this.msgCount &&
          other.wordCount == this.wordCount);
}

class MetaCompanion extends UpdateCompanion<MetaData> {
  final Value<int> id;
  final Value<int> msgCount;
  final Value<int> wordCount;
  const MetaCompanion({
    this.id = const Value.absent(),
    this.msgCount = const Value.absent(),
    this.wordCount = const Value.absent(),
  });
  MetaCompanion.insert({
    this.id = const Value.absent(),
    this.msgCount = const Value.absent(),
    this.wordCount = const Value.absent(),
  });
  static Insertable<MetaData> custom({
    Expression<int>? id,
    Expression<int>? msgCount,
    Expression<int>? wordCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (msgCount != null) 'msg_count': msgCount,
      if (wordCount != null) 'word_count': wordCount,
    });
  }

  MetaCompanion copyWith({
    Value<int>? id,
    Value<int>? msgCount,
    Value<int>? wordCount,
  }) {
    return MetaCompanion(
      id: id ?? this.id,
      msgCount: msgCount ?? this.msgCount,
      wordCount: wordCount ?? this.wordCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (msgCount.present) {
      map['msg_count'] = Variable<int>(msgCount.value);
    }
    if (wordCount.present) {
      map['word_count'] = Variable<int>(wordCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetaCompanion(')
          ..write('id: $id, ')
          ..write('msgCount: $msgCount, ')
          ..write('wordCount: $wordCount')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Words words = Words(this);
  late final Prefixes prefixes = Prefixes(this);
  late final Suffixes suffixes = Suffixes(this);
  late final HeadDistances headDistances = HeadDistances(this);
  late final TailDistances tailDistances = TailDistances(this);
  late final Meta meta = Meta(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    words,
    prefixes,
    suffixes,
    headDistances,
    tailDistances,
    meta,
  ];
  @override
  int get schemaVersion => 2;
}
