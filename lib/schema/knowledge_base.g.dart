// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_base.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordHashMeta = const VerificationMeta(
    'wordHash',
  );
  @override
  late final GeneratedColumn<String> wordHash = GeneratedColumn<String>(
    'word_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, int>, String>
  prefixes = GeneratedColumn<String>(
    'prefixes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, int>>($WordsTable.$converterprefixes);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, int>, String>
  suffixes = GeneratedColumn<String>(
    'suffixes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, int>>($WordsTable.$convertersuffixes);
  @override
  late final GeneratedColumnWithTypeConverter<Map<int, int>, String>
  distFromHead = GeneratedColumn<String>(
    'dist_from_head',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<int, int>>($WordsTable.$converterdistFromHead);
  @override
  late final GeneratedColumnWithTypeConverter<Map<int, int>, String>
  distFromTail = GeneratedColumn<String>(
    'dist_from_tail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<int, int>>($WordsTable.$converterdistFromTail);
  static const VerificationMeta _totalOccurancesMeta = const VerificationMeta(
    'totalOccurances',
  );
  @override
  late final GeneratedColumn<int> totalOccurances = GeneratedColumn<int>(
    'total_occurances',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _msgOccurancesMeta = const VerificationMeta(
    'msgOccurances',
  );
  @override
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
  VerificationContext validateIntegrity(
    Insertable<Word> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word_hash')) {
      context.handle(
        _wordHashMeta,
        wordHash.isAcceptableOrUnknown(data['word_hash']!, _wordHashMeta),
      );
    } else if (isInserting) {
      context.missing(_wordHashMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('total_occurances')) {
      context.handle(
        _totalOccurancesMeta,
        totalOccurances.isAcceptableOrUnknown(
          data['total_occurances']!,
          _totalOccurancesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalOccurancesMeta);
    }
    if (data.containsKey('msg_occurances')) {
      context.handle(
        _msgOccurancesMeta,
        msgOccurances.isAcceptableOrUnknown(
          data['msg_occurances']!,
          _msgOccurancesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_msgOccurancesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      wordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_hash'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      prefixes: $WordsTable.$converterprefixes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}prefixes'],
        )!,
      ),
      suffixes: $WordsTable.$convertersuffixes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}suffixes'],
        )!,
      ),
      distFromHead: $WordsTable.$converterdistFromHead.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dist_from_head'],
        )!,
      ),
      distFromTail: $WordsTable.$converterdistFromTail.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dist_from_tail'],
        )!,
      ),
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
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, int>, String> $converterprefixes =
      const StringIntMapConverter();
  static TypeConverter<Map<String, int>, String> $convertersuffixes =
      const StringIntMapConverter();
  static TypeConverter<Map<int, int>, String> $converterdistFromHead =
      const IntIntMapConverter();
  static TypeConverter<Map<int, int>, String> $converterdistFromTail =
      const IntIntMapConverter();
}

class Word extends DataClass implements Insertable<Word> {
  final String wordHash;
  final String word;
  final Map<String, int> prefixes;
  final Map<String, int> suffixes;
  final Map<int, int> distFromHead;
  final Map<int, int> distFromTail;
  final int totalOccurances;
  final int msgOccurances;
  const Word({
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
    {
      map['prefixes'] = Variable<String>(
        $WordsTable.$converterprefixes.toSql(prefixes),
      );
    }
    {
      map['suffixes'] = Variable<String>(
        $WordsTable.$convertersuffixes.toSql(suffixes),
      );
    }
    {
      map['dist_from_head'] = Variable<String>(
        $WordsTable.$converterdistFromHead.toSql(distFromHead),
      );
    }
    {
      map['dist_from_tail'] = Variable<String>(
        $WordsTable.$converterdistFromTail.toSql(distFromTail),
      );
    }
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

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      wordHash: serializer.fromJson<String>(json['wordHash']),
      word: serializer.fromJson<String>(json['word']),
      prefixes: serializer.fromJson<Map<String, int>>(json['prefixes']),
      suffixes: serializer.fromJson<Map<String, int>>(json['suffixes']),
      distFromHead: serializer.fromJson<Map<int, int>>(json['distFromHead']),
      distFromTail: serializer.fromJson<Map<int, int>>(json['distFromTail']),
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
      'prefixes': serializer.toJson<Map<String, int>>(prefixes),
      'suffixes': serializer.toJson<Map<String, int>>(suffixes),
      'distFromHead': serializer.toJson<Map<int, int>>(distFromHead),
      'distFromTail': serializer.toJson<Map<int, int>>(distFromTail),
      'totalOccurances': serializer.toJson<int>(totalOccurances),
      'msgOccurances': serializer.toJson<int>(msgOccurances),
    };
  }

  Word copyWith({
    String? wordHash,
    String? word,
    Map<String, int>? prefixes,
    Map<String, int>? suffixes,
    Map<int, int>? distFromHead,
    Map<int, int>? distFromTail,
    int? totalOccurances,
    int? msgOccurances,
  }) => Word(
    wordHash: wordHash ?? this.wordHash,
    word: word ?? this.word,
    prefixes: prefixes ?? this.prefixes,
    suffixes: suffixes ?? this.suffixes,
    distFromHead: distFromHead ?? this.distFromHead,
    distFromTail: distFromTail ?? this.distFromTail,
    totalOccurances: totalOccurances ?? this.totalOccurances,
    msgOccurances: msgOccurances ?? this.msgOccurances,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
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
    return (StringBuffer('Word(')
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
      (other is Word &&
          other.wordHash == this.wordHash &&
          other.word == this.word &&
          other.prefixes == this.prefixes &&
          other.suffixes == this.suffixes &&
          other.distFromHead == this.distFromHead &&
          other.distFromTail == this.distFromTail &&
          other.totalOccurances == this.totalOccurances &&
          other.msgOccurances == this.msgOccurances);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> wordHash;
  final Value<String> word;
  final Value<Map<String, int>> prefixes;
  final Value<Map<String, int>> suffixes;
  final Value<Map<int, int>> distFromHead;
  final Value<Map<int, int>> distFromTail;
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
    required Map<String, int> prefixes,
    required Map<String, int> suffixes,
    required Map<int, int> distFromHead,
    required Map<int, int> distFromTail,
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
  static Insertable<Word> custom({
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
    Value<Map<String, int>>? prefixes,
    Value<Map<String, int>>? suffixes,
    Value<Map<int, int>>? distFromHead,
    Value<Map<int, int>>? distFromTail,
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
      map['prefixes'] = Variable<String>(
        $WordsTable.$converterprefixes.toSql(prefixes.value),
      );
    }
    if (suffixes.present) {
      map['suffixes'] = Variable<String>(
        $WordsTable.$convertersuffixes.toSql(suffixes.value),
      );
    }
    if (distFromHead.present) {
      map['dist_from_head'] = Variable<String>(
        $WordsTable.$converterdistFromHead.toSql(distFromHead.value),
      );
    }
    if (distFromTail.present) {
      map['dist_from_tail'] = Variable<String>(
        $WordsTable.$converterdistFromTail.toSql(distFromTail.value),
      );
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

class $MetaTable extends Meta with TableInfo<$MetaTable, MetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _msgCountMeta = const VerificationMeta(
    'msgCount',
  );
  @override
  late final GeneratedColumn<int> msgCount = GeneratedColumn<int>(
    'msg_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _wordCountMeta = const VerificationMeta(
    'wordCount',
  );
  @override
  late final GeneratedColumn<int> wordCount = GeneratedColumn<int>(
    'word_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, msgCount, wordCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<MetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('msg_count')) {
      context.handle(
        _msgCountMeta,
        msgCount.isAcceptableOrUnknown(data['msg_count']!, _msgCountMeta),
      );
    }
    if (data.containsKey('word_count')) {
      context.handle(
        _wordCountMeta,
        wordCount.isAcceptableOrUnknown(data['word_count']!, _wordCountMeta),
      );
    }
    return context;
  }

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
  $MetaTable createAlias(String alias) {
    return $MetaTable(attachedDatabase, alias);
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

abstract class _$KnowledgeBase extends GeneratedDatabase {
  _$KnowledgeBase(QueryExecutor e) : super(e);
  $KnowledgeBaseManager get managers => $KnowledgeBaseManager(this);
  late final $WordsTable words = $WordsTable(this);
  late final $MetaTable meta = $MetaTable(this);
  Selectable<Word> randomWord() {
    return customSelect(
      'SELECT * FROM Words WHERE "rowid" =(abs(random()) % (SELECT (SELECT max("rowid") FROM Words) + 1))',
      variables: [],
      readsFrom: {words},
    ).asyncMap(words.mapFromRow);
  }

  Selectable<int> countWords() {
    return customSelect(
      'SELECT count("rowid") AS _c0 FROM Words',
      variables: [],
      readsFrom: {words},
    ).map((QueryRow row) => row.read<int>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, meta];
}

typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      required String wordHash,
      required String word,
      required Map<String, int> prefixes,
      required Map<String, int> suffixes,
      required Map<int, int> distFromHead,
      required Map<int, int> distFromTail,
      required int totalOccurances,
      required int msgOccurances,
      Value<int> rowid,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<String> wordHash,
      Value<String> word,
      Value<Map<String, int>> prefixes,
      Value<Map<String, int>> suffixes,
      Value<Map<int, int>> distFromHead,
      Value<Map<int, int>> distFromTail,
      Value<int> totalOccurances,
      Value<int> msgOccurances,
      Value<int> rowid,
    });

class $$WordsTableFilterComposer
    extends Composer<_$KnowledgeBase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get wordHash => $composableBuilder(
    column: $table.wordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<String, int>, Map<String, int>, String>
  get prefixes => $composableBuilder(
    column: $table.prefixes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<String, int>, Map<String, int>, String>
  get suffixes => $composableBuilder(
    column: $table.suffixes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<int, int>, Map<int, int>, String>
  get distFromHead => $composableBuilder(
    column: $table.distFromHead,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<int, int>, Map<int, int>, String>
  get distFromTail => $composableBuilder(
    column: $table.distFromTail,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get totalOccurances => $composableBuilder(
    column: $table.totalOccurances,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get msgOccurances => $composableBuilder(
    column: $table.msgOccurances,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordsTableOrderingComposer
    extends Composer<_$KnowledgeBase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get wordHash => $composableBuilder(
    column: $table.wordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prefixes => $composableBuilder(
    column: $table.prefixes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suffixes => $composableBuilder(
    column: $table.suffixes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distFromHead => $composableBuilder(
    column: $table.distFromHead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distFromTail => $composableBuilder(
    column: $table.distFromTail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalOccurances => $composableBuilder(
    column: $table.totalOccurances,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get msgOccurances => $composableBuilder(
    column: $table.msgOccurances,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordsTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get wordHash =>
      $composableBuilder(column: $table.wordHash, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, int>, String> get prefixes =>
      $composableBuilder(column: $table.prefixes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, int>, String> get suffixes =>
      $composableBuilder(column: $table.suffixes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<int, int>, String> get distFromHead =>
      $composableBuilder(
        column: $table.distFromHead,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Map<int, int>, String> get distFromTail =>
      $composableBuilder(
        column: $table.distFromTail,
        builder: (column) => column,
      );

  GeneratedColumn<int> get totalOccurances => $composableBuilder(
    column: $table.totalOccurances,
    builder: (column) => column,
  );

  GeneratedColumn<int> get msgOccurances => $composableBuilder(
    column: $table.msgOccurances,
    builder: (column) => column,
  );
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$KnowledgeBase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$KnowledgeBase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordHash = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<Map<String, int>> prefixes = const Value.absent(),
                Value<Map<String, int>> suffixes = const Value.absent(),
                Value<Map<int, int>> distFromHead = const Value.absent(),
                Value<Map<int, int>> distFromTail = const Value.absent(),
                Value<int> totalOccurances = const Value.absent(),
                Value<int> msgOccurances = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion(
                wordHash: wordHash,
                word: word,
                prefixes: prefixes,
                suffixes: suffixes,
                distFromHead: distFromHead,
                distFromTail: distFromTail,
                totalOccurances: totalOccurances,
                msgOccurances: msgOccurances,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required String word,
                required Map<String, int> prefixes,
                required Map<String, int> suffixes,
                required Map<int, int> distFromHead,
                required Map<int, int> distFromTail,
                required int totalOccurances,
                required int msgOccurances,
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion.insert(
                wordHash: wordHash,
                word: word,
                prefixes: prefixes,
                suffixes: suffixes,
                distFromHead: distFromHead,
                distFromTail: distFromTail,
                totalOccurances: totalOccurances,
                msgOccurances: msgOccurances,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$KnowledgeBase, $WordsTable, Word>),
      Word,
      PrefetchHooks Function()
    >;
typedef $$MetaTableCreateCompanionBuilder =
    MetaCompanion Function({
      Value<int> id,
      Value<int> msgCount,
      Value<int> wordCount,
    });
typedef $$MetaTableUpdateCompanionBuilder =
    MetaCompanion Function({
      Value<int> id,
      Value<int> msgCount,
      Value<int> wordCount,
    });

class $$MetaTableFilterComposer extends Composer<_$KnowledgeBase, $MetaTable> {
  $$MetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get msgCount => $composableBuilder(
    column: $table.msgCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wordCount => $composableBuilder(
    column: $table.wordCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MetaTableOrderingComposer
    extends Composer<_$KnowledgeBase, $MetaTable> {
  $$MetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get msgCount => $composableBuilder(
    column: $table.msgCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wordCount => $composableBuilder(
    column: $table.wordCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MetaTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $MetaTable> {
  $$MetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get msgCount =>
      $composableBuilder(column: $table.msgCount, builder: (column) => column);

  GeneratedColumn<int> get wordCount =>
      $composableBuilder(column: $table.wordCount, builder: (column) => column);
}

class $$MetaTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $MetaTable,
          MetaData,
          $$MetaTableFilterComposer,
          $$MetaTableOrderingComposer,
          $$MetaTableAnnotationComposer,
          $$MetaTableCreateCompanionBuilder,
          $$MetaTableUpdateCompanionBuilder,
          (MetaData, BaseReferences<_$KnowledgeBase, $MetaTable, MetaData>),
          MetaData,
          PrefetchHooks Function()
        > {
  $$MetaTableTableManager(_$KnowledgeBase db, $MetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> msgCount = const Value.absent(),
                Value<int> wordCount = const Value.absent(),
              }) => MetaCompanion(
                id: id,
                msgCount: msgCount,
                wordCount: wordCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> msgCount = const Value.absent(),
                Value<int> wordCount = const Value.absent(),
              }) => MetaCompanion.insert(
                id: id,
                msgCount: msgCount,
                wordCount: wordCount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MetaTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $MetaTable,
      MetaData,
      $$MetaTableFilterComposer,
      $$MetaTableOrderingComposer,
      $$MetaTableAnnotationComposer,
      $$MetaTableCreateCompanionBuilder,
      $$MetaTableUpdateCompanionBuilder,
      (MetaData, BaseReferences<_$KnowledgeBase, $MetaTable, MetaData>),
      MetaData,
      PrefetchHooks Function()
    >;

class $KnowledgeBaseManager {
  final _$KnowledgeBase _db;
  $KnowledgeBaseManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$MetaTableTableManager get meta => $$MetaTableTableManager(_db, _db.meta);
}
