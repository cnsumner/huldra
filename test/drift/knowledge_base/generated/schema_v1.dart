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
  late final GeneratedColumn<String> prefixes = GeneratedColumn<String>(
    'prefixes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> suffixes = GeneratedColumn<String>(
    'suffixes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> distFromHead = GeneratedColumn<String>(
    'dist_from_head',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> distFromTail = GeneratedColumn<String>(
    'dist_from_tail',
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
    prefixes,
    suffixes,
    distFromHead,
    distFromTail,
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
      prefixes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefixes'],
      )!,
      suffixes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suffixes'],
      )!,
      distFromHead: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dist_from_head'],
      )!,
      distFromTail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dist_from_tail'],
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
  final String prefixes;
  final String suffixes;
  final String distFromHead;
  final String distFromTail;
  final int totalOccurances;
  final int msgOccurances;
  const WordsData({
    required this.wordHash,
    required this.word,
    required this.prefixes,
    required this.suffixes,
    required this.distFromHead,
    required this.distFromTail,
    required this.totalOccurances,
    required this.msgOccurances,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_hash'] = Variable<String>(wordHash);
    map['word'] = Variable<String>(word);
    map['prefixes'] = Variable<String>(prefixes);
    map['suffixes'] = Variable<String>(suffixes);
    map['dist_from_head'] = Variable<String>(distFromHead);
    map['dist_from_tail'] = Variable<String>(distFromTail);
    map['total_occurances'] = Variable<int>(totalOccurances);
    map['msg_occurances'] = Variable<int>(msgOccurances);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      wordHash: Value(wordHash),
      word: Value(word),
      prefixes: Value(prefixes),
      suffixes: Value(suffixes),
      distFromHead: Value(distFromHead),
      distFromTail: Value(distFromTail),
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
      prefixes: serializer.fromJson<String>(json['prefixes']),
      suffixes: serializer.fromJson<String>(json['suffixes']),
      distFromHead: serializer.fromJson<String>(json['distFromHead']),
      distFromTail: serializer.fromJson<String>(json['distFromTail']),
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
      'prefixes': serializer.toJson<String>(prefixes),
      'suffixes': serializer.toJson<String>(suffixes),
      'distFromHead': serializer.toJson<String>(distFromHead),
      'distFromTail': serializer.toJson<String>(distFromTail),
      'totalOccurances': serializer.toJson<int>(totalOccurances),
      'msgOccurances': serializer.toJson<int>(msgOccurances),
    };
  }

  WordsData copyWith({
    String? wordHash,
    String? word,
    String? prefixes,
    String? suffixes,
    String? distFromHead,
    String? distFromTail,
    int? totalOccurances,
    int? msgOccurances,
  }) => WordsData(
    wordHash: wordHash ?? this.wordHash,
    word: word ?? this.word,
    prefixes: prefixes ?? this.prefixes,
    suffixes: suffixes ?? this.suffixes,
    distFromHead: distFromHead ?? this.distFromHead,
    distFromTail: distFromTail ?? this.distFromTail,
    totalOccurances: totalOccurances ?? this.totalOccurances,
    msgOccurances: msgOccurances ?? this.msgOccurances,
  );
  WordsData copyWithCompanion(WordsCompanion data) {
    return WordsData(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      word: data.word.present ? data.word.value : this.word,
      prefixes: data.prefixes.present ? data.prefixes.value : this.prefixes,
      suffixes: data.suffixes.present ? data.suffixes.value : this.suffixes,
      distFromHead: data.distFromHead.present
          ? data.distFromHead.value
          : this.distFromHead,
      distFromTail: data.distFromTail.present
          ? data.distFromTail.value
          : this.distFromTail,
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
          ..write('prefixes: $prefixes, ')
          ..write('suffixes: $suffixes, ')
          ..write('distFromHead: $distFromHead, ')
          ..write('distFromTail: $distFromTail, ')
          ..write('totalOccurances: $totalOccurances, ')
          ..write('msgOccurances: $msgOccurances')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    wordHash,
    word,
    prefixes,
    suffixes,
    distFromHead,
    distFromTail,
    totalOccurances,
    msgOccurances,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsData &&
          other.wordHash == this.wordHash &&
          other.word == this.word &&
          other.prefixes == this.prefixes &&
          other.suffixes == this.suffixes &&
          other.distFromHead == this.distFromHead &&
          other.distFromTail == this.distFromTail &&
          other.totalOccurances == this.totalOccurances &&
          other.msgOccurances == this.msgOccurances);
}

class WordsCompanion extends UpdateCompanion<WordsData> {
  final Value<String> wordHash;
  final Value<String> word;
  final Value<String> prefixes;
  final Value<String> suffixes;
  final Value<String> distFromHead;
  final Value<String> distFromTail;
  final Value<int> totalOccurances;
  final Value<int> msgOccurances;
  final Value<int> rowid;
  const WordsCompanion({
    this.wordHash = const Value.absent(),
    this.word = const Value.absent(),
    this.prefixes = const Value.absent(),
    this.suffixes = const Value.absent(),
    this.distFromHead = const Value.absent(),
    this.distFromTail = const Value.absent(),
    this.totalOccurances = const Value.absent(),
    this.msgOccurances = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsCompanion.insert({
    required String wordHash,
    required String word,
    required String prefixes,
    required String suffixes,
    required String distFromHead,
    required String distFromTail,
    required int totalOccurances,
    required int msgOccurances,
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       word = Value(word),
       prefixes = Value(prefixes),
       suffixes = Value(suffixes),
       distFromHead = Value(distFromHead),
       distFromTail = Value(distFromTail),
       totalOccurances = Value(totalOccurances),
       msgOccurances = Value(msgOccurances);
  static Insertable<WordsData> custom({
    Expression<String>? wordHash,
    Expression<String>? word,
    Expression<String>? prefixes,
    Expression<String>? suffixes,
    Expression<String>? distFromHead,
    Expression<String>? distFromTail,
    Expression<int>? totalOccurances,
    Expression<int>? msgOccurances,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordHash != null) 'word_hash': wordHash,
      if (word != null) 'word': word,
      if (prefixes != null) 'prefixes': prefixes,
      if (suffixes != null) 'suffixes': suffixes,
      if (distFromHead != null) 'dist_from_head': distFromHead,
      if (distFromTail != null) 'dist_from_tail': distFromTail,
      if (totalOccurances != null) 'total_occurances': totalOccurances,
      if (msgOccurances != null) 'msg_occurances': msgOccurances,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsCompanion copyWith({
    Value<String>? wordHash,
    Value<String>? word,
    Value<String>? prefixes,
    Value<String>? suffixes,
    Value<String>? distFromHead,
    Value<String>? distFromTail,
    Value<int>? totalOccurances,
    Value<int>? msgOccurances,
    Value<int>? rowid,
  }) {
    return WordsCompanion(
      wordHash: wordHash ?? this.wordHash,
      word: word ?? this.word,
      prefixes: prefixes ?? this.prefixes,
      suffixes: suffixes ?? this.suffixes,
      distFromHead: distFromHead ?? this.distFromHead,
      distFromTail: distFromTail ?? this.distFromTail,
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
    if (prefixes.present) {
      map['prefixes'] = Variable<String>(prefixes.value);
    }
    if (suffixes.present) {
      map['suffixes'] = Variable<String>(suffixes.value);
    }
    if (distFromHead.present) {
      map['dist_from_head'] = Variable<String>(distFromHead.value);
    }
    if (distFromTail.present) {
      map['dist_from_tail'] = Variable<String>(distFromTail.value);
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
          ..write('prefixes: $prefixes, ')
          ..write('suffixes: $suffixes, ')
          ..write('distFromHead: $distFromHead, ')
          ..write('distFromTail: $distFromTail, ')
          ..write('totalOccurances: $totalOccurances, ')
          ..write('msgOccurances: $msgOccurances, ')
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

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final Words words = Words(this);
  late final Meta meta = Meta(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, meta];
  @override
  int get schemaVersion => 1;
}
