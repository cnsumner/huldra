// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_base.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Word extends DataClass implements Insertable<Word> {
  final String wordHash;
  final String word;
  final Map<String, int> prefixes;
  final Map<String, int> suffixes;
  final Map<int, int> distFromHead;
  final Map<int, int> distFromTail;
  final int totalOccurances;
  final int msgOccurances;
  Word(
      {@required this.wordHash,
      @required this.word,
      @required this.prefixes,
      @required this.suffixes,
      @required this.distFromHead,
      @required this.distFromTail,
      @required this.totalOccurances,
      @required this.msgOccurances});
  factory Word.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Word(
      wordHash: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}word_hash']),
      word: stringType.mapFromDatabaseResponse(data['${effectivePrefix}word']),
      prefixes: $WordsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}prefixes'])),
      suffixes: $WordsTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}suffixes'])),
      distFromHead: $WordsTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dist_from_head'])),
      distFromTail: $WordsTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dist_from_tail'])),
      totalOccurances: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_occurances']),
      msgOccurances: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}msg_occurances']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || wordHash != null) {
      map['word_hash'] = Variable<String>(wordHash);
    }
    if (!nullToAbsent || word != null) {
      map['word'] = Variable<String>(word);
    }
    if (!nullToAbsent || prefixes != null) {
      final converter = $WordsTable.$converter0;
      map['prefixes'] = Variable<String>(converter.mapToSql(prefixes));
    }
    if (!nullToAbsent || suffixes != null) {
      final converter = $WordsTable.$converter1;
      map['suffixes'] = Variable<String>(converter.mapToSql(suffixes));
    }
    if (!nullToAbsent || distFromHead != null) {
      final converter = $WordsTable.$converter2;
      map['dist_from_head'] =
          Variable<String>(converter.mapToSql(distFromHead));
    }
    if (!nullToAbsent || distFromTail != null) {
      final converter = $WordsTable.$converter3;
      map['dist_from_tail'] =
          Variable<String>(converter.mapToSql(distFromTail));
    }
    if (!nullToAbsent || totalOccurances != null) {
      map['total_occurances'] = Variable<int>(totalOccurances);
    }
    if (!nullToAbsent || msgOccurances != null) {
      map['msg_occurances'] = Variable<int>(msgOccurances);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      wordHash: wordHash == null && nullToAbsent
          ? const Value.absent()
          : Value(wordHash),
      word: word == null && nullToAbsent ? const Value.absent() : Value(word),
      prefixes: prefixes == null && nullToAbsent
          ? const Value.absent()
          : Value(prefixes),
      suffixes: suffixes == null && nullToAbsent
          ? const Value.absent()
          : Value(suffixes),
      distFromHead: distFromHead == null && nullToAbsent
          ? const Value.absent()
          : Value(distFromHead),
      distFromTail: distFromTail == null && nullToAbsent
          ? const Value.absent()
          : Value(distFromTail),
      totalOccurances: totalOccurances == null && nullToAbsent
          ? const Value.absent()
          : Value(totalOccurances),
      msgOccurances: msgOccurances == null && nullToAbsent
          ? const Value.absent()
          : Value(msgOccurances),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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

  Word copyWith(
          {String wordHash,
          String word,
          Map<String, int> prefixes,
          Map<String, int> suffixes,
          Map<int, int> distFromHead,
          Map<int, int> distFromTail,
          int totalOccurances,
          int msgOccurances}) =>
      Word(
        wordHash: wordHash ?? this.wordHash,
        word: word ?? this.word,
        prefixes: prefixes ?? this.prefixes,
        suffixes: suffixes ?? this.suffixes,
        distFromHead: distFromHead ?? this.distFromHead,
        distFromTail: distFromTail ?? this.distFromTail,
        totalOccurances: totalOccurances ?? this.totalOccurances,
        msgOccurances: msgOccurances ?? this.msgOccurances,
      );
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
  int get hashCode => $mrjf($mrjc(
      wordHash.hashCode,
      $mrjc(
          word.hashCode,
          $mrjc(
              prefixes.hashCode,
              $mrjc(
                  suffixes.hashCode,
                  $mrjc(
                      distFromHead.hashCode,
                      $mrjc(
                          distFromTail.hashCode,
                          $mrjc(totalOccurances.hashCode,
                              msgOccurances.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
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
  const WordsCompanion({
    this.wordHash = const Value.absent(),
    this.word = const Value.absent(),
    this.prefixes = const Value.absent(),
    this.suffixes = const Value.absent(),
    this.distFromHead = const Value.absent(),
    this.distFromTail = const Value.absent(),
    this.totalOccurances = const Value.absent(),
    this.msgOccurances = const Value.absent(),
  });
  WordsCompanion.insert({
    @required String wordHash,
    @required String word,
    @required Map<String, int> prefixes,
    @required Map<String, int> suffixes,
    @required Map<int, int> distFromHead,
    @required Map<int, int> distFromTail,
    @required int totalOccurances,
    @required int msgOccurances,
  })  : wordHash = Value(wordHash),
        word = Value(word),
        prefixes = Value(prefixes),
        suffixes = Value(suffixes),
        distFromHead = Value(distFromHead),
        distFromTail = Value(distFromTail),
        totalOccurances = Value(totalOccurances),
        msgOccurances = Value(msgOccurances);
  static Insertable<Word> custom({
    Expression<String> wordHash,
    Expression<String> word,
    Expression<String> prefixes,
    Expression<String> suffixes,
    Expression<String> distFromHead,
    Expression<String> distFromTail,
    Expression<int> totalOccurances,
    Expression<int> msgOccurances,
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
    });
  }

  WordsCompanion copyWith(
      {Value<String> wordHash,
      Value<String> word,
      Value<Map<String, int>> prefixes,
      Value<Map<String, int>> suffixes,
      Value<Map<int, int>> distFromHead,
      Value<Map<int, int>> distFromTail,
      Value<int> totalOccurances,
      Value<int> msgOccurances}) {
    return WordsCompanion(
      wordHash: wordHash ?? this.wordHash,
      word: word ?? this.word,
      prefixes: prefixes ?? this.prefixes,
      suffixes: suffixes ?? this.suffixes,
      distFromHead: distFromHead ?? this.distFromHead,
      distFromTail: distFromTail ?? this.distFromTail,
      totalOccurances: totalOccurances ?? this.totalOccurances,
      msgOccurances: msgOccurances ?? this.msgOccurances,
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
      final converter = $WordsTable.$converter0;
      map['prefixes'] = Variable<String>(converter.mapToSql(prefixes.value));
    }
    if (suffixes.present) {
      final converter = $WordsTable.$converter1;
      map['suffixes'] = Variable<String>(converter.mapToSql(suffixes.value));
    }
    if (distFromHead.present) {
      final converter = $WordsTable.$converter2;
      map['dist_from_head'] =
          Variable<String>(converter.mapToSql(distFromHead.value));
    }
    if (distFromTail.present) {
      final converter = $WordsTable.$converter3;
      map['dist_from_tail'] =
          Variable<String>(converter.mapToSql(distFromTail.value));
    }
    if (totalOccurances.present) {
      map['total_occurances'] = Variable<int>(totalOccurances.value);
    }
    if (msgOccurances.present) {
      map['msg_occurances'] = Variable<int>(msgOccurances.value);
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
          ..write('msgOccurances: $msgOccurances')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  final GeneratedDatabase _db;
  final String _alias;
  $WordsTable(this._db, [this._alias]);
  final VerificationMeta _wordHashMeta = const VerificationMeta('wordHash');
  GeneratedTextColumn _wordHash;
  @override
  GeneratedTextColumn get wordHash => _wordHash ??= _constructWordHash();
  GeneratedTextColumn _constructWordHash() {
    return GeneratedTextColumn(
      'word_hash',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wordMeta = const VerificationMeta('word');
  GeneratedTextColumn _word;
  @override
  GeneratedTextColumn get word => _word ??= _constructWord();
  GeneratedTextColumn _constructWord() {
    return GeneratedTextColumn(
      'word',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prefixesMeta = const VerificationMeta('prefixes');
  GeneratedTextColumn _prefixes;
  @override
  GeneratedTextColumn get prefixes => _prefixes ??= _constructPrefixes();
  GeneratedTextColumn _constructPrefixes() {
    return GeneratedTextColumn(
      'prefixes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _suffixesMeta = const VerificationMeta('suffixes');
  GeneratedTextColumn _suffixes;
  @override
  GeneratedTextColumn get suffixes => _suffixes ??= _constructSuffixes();
  GeneratedTextColumn _constructSuffixes() {
    return GeneratedTextColumn(
      'suffixes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _distFromHeadMeta =
      const VerificationMeta('distFromHead');
  GeneratedTextColumn _distFromHead;
  @override
  GeneratedTextColumn get distFromHead =>
      _distFromHead ??= _constructDistFromHead();
  GeneratedTextColumn _constructDistFromHead() {
    return GeneratedTextColumn(
      'dist_from_head',
      $tableName,
      false,
    );
  }

  final VerificationMeta _distFromTailMeta =
      const VerificationMeta('distFromTail');
  GeneratedTextColumn _distFromTail;
  @override
  GeneratedTextColumn get distFromTail =>
      _distFromTail ??= _constructDistFromTail();
  GeneratedTextColumn _constructDistFromTail() {
    return GeneratedTextColumn(
      'dist_from_tail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalOccurancesMeta =
      const VerificationMeta('totalOccurances');
  GeneratedIntColumn _totalOccurances;
  @override
  GeneratedIntColumn get totalOccurances =>
      _totalOccurances ??= _constructTotalOccurances();
  GeneratedIntColumn _constructTotalOccurances() {
    return GeneratedIntColumn(
      'total_occurances',
      $tableName,
      false,
    );
  }

  final VerificationMeta _msgOccurancesMeta =
      const VerificationMeta('msgOccurances');
  GeneratedIntColumn _msgOccurances;
  @override
  GeneratedIntColumn get msgOccurances =>
      _msgOccurances ??= _constructMsgOccurances();
  GeneratedIntColumn _constructMsgOccurances() {
    return GeneratedIntColumn(
      'msg_occurances',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        wordHash,
        word,
        prefixes,
        suffixes,
        distFromHead,
        distFromTail,
        totalOccurances,
        msgOccurances
      ];
  @override
  $WordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'words';
  @override
  final String actualTableName = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word_hash')) {
      context.handle(_wordHashMeta,
          wordHash.isAcceptableOrUnknown(data['word_hash'], _wordHashMeta));
    } else if (isInserting) {
      context.missing(_wordHashMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word'], _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    context.handle(_prefixesMeta, const VerificationResult.success());
    context.handle(_suffixesMeta, const VerificationResult.success());
    context.handle(_distFromHeadMeta, const VerificationResult.success());
    context.handle(_distFromTailMeta, const VerificationResult.success());
    if (data.containsKey('total_occurances')) {
      context.handle(
          _totalOccurancesMeta,
          totalOccurances.isAcceptableOrUnknown(
              data['total_occurances'], _totalOccurancesMeta));
    } else if (isInserting) {
      context.missing(_totalOccurancesMeta);
    }
    if (data.containsKey('msg_occurances')) {
      context.handle(
          _msgOccurancesMeta,
          msgOccurances.isAcceptableOrUnknown(
              data['msg_occurances'], _msgOccurancesMeta));
    } else if (isInserting) {
      context.missing(_msgOccurancesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash};
  @override
  Word map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Word.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(_db, alias);
  }

  static TypeConverter<Map<String, int>, String> $converter0 =
      const StringIntMapConverter();
  static TypeConverter<Map<String, int>, String> $converter1 =
      const StringIntMapConverter();
  static TypeConverter<Map<int, int>, String> $converter2 =
      const IntIntMapConverter();
  static TypeConverter<Map<int, int>, String> $converter3 =
      const IntIntMapConverter();
}

class MetaData extends DataClass implements Insertable<MetaData> {
  final int id;
  final int msgCount;
  final int wordCount;
  MetaData(
      {@required this.id, @required this.msgCount, @required this.wordCount});
  factory MetaData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return MetaData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      msgCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}msg_count']),
      wordCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}word_count']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || msgCount != null) {
      map['msg_count'] = Variable<int>(msgCount);
    }
    if (!nullToAbsent || wordCount != null) {
      map['word_count'] = Variable<int>(wordCount);
    }
    return map;
  }

  MetaCompanion toCompanion(bool nullToAbsent) {
    return MetaCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      msgCount: msgCount == null && nullToAbsent
          ? const Value.absent()
          : Value(msgCount),
      wordCount: wordCount == null && nullToAbsent
          ? const Value.absent()
          : Value(wordCount),
    );
  }

  factory MetaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MetaData(
      id: serializer.fromJson<int>(json['id']),
      msgCount: serializer.fromJson<int>(json['msgCount']),
      wordCount: serializer.fromJson<int>(json['wordCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'msgCount': serializer.toJson<int>(msgCount),
      'wordCount': serializer.toJson<int>(wordCount),
    };
  }

  MetaData copyWith({int id, int msgCount, int wordCount}) => MetaData(
        id: id ?? this.id,
        msgCount: msgCount ?? this.msgCount,
        wordCount: wordCount ?? this.wordCount,
      );
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
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(msgCount.hashCode, wordCount.hashCode)));
  @override
  bool operator ==(dynamic other) =>
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
    Expression<int> id,
    Expression<int> msgCount,
    Expression<int> wordCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (msgCount != null) 'msg_count': msgCount,
      if (wordCount != null) 'word_count': wordCount,
    });
  }

  MetaCompanion copyWith(
      {Value<int> id, Value<int> msgCount, Value<int> wordCount}) {
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

class $MetaTable extends Meta with TableInfo<$MetaTable, MetaData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MetaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        defaultValue: const Constant(1));
  }

  final VerificationMeta _msgCountMeta = const VerificationMeta('msgCount');
  GeneratedIntColumn _msgCount;
  @override
  GeneratedIntColumn get msgCount => _msgCount ??= _constructMsgCount();
  GeneratedIntColumn _constructMsgCount() {
    return GeneratedIntColumn('msg_count', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _wordCountMeta = const VerificationMeta('wordCount');
  GeneratedIntColumn _wordCount;
  @override
  GeneratedIntColumn get wordCount => _wordCount ??= _constructWordCount();
  GeneratedIntColumn _constructWordCount() {
    return GeneratedIntColumn('word_count', $tableName, false,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [id, msgCount, wordCount];
  @override
  $MetaTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meta';
  @override
  final String actualTableName = 'meta';
  @override
  VerificationContext validateIntegrity(Insertable<MetaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('msg_count')) {
      context.handle(_msgCountMeta,
          msgCount.isAcceptableOrUnknown(data['msg_count'], _msgCountMeta));
    }
    if (data.containsKey('word_count')) {
      context.handle(_wordCountMeta,
          wordCount.isAcceptableOrUnknown(data['word_count'], _wordCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MetaData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MetaData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MetaTable createAlias(String alias) {
    return $MetaTable(_db, alias);
  }
}

abstract class _$KnowledgeBase extends GeneratedDatabase {
  _$KnowledgeBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WordsTable _words;
  $WordsTable get words => _words ??= $WordsTable(this);
  $MetaTable _meta;
  $MetaTable get meta => _meta ??= $MetaTable(this);
  Selectable<Word> randomWord() {
    return customSelect(
        'select * from Words where rowid = (abs(random()) % (select (select max(rowid) from Words)+1));',
        variables: [],
        readsFrom: {words}).map(words.mapFromRow);
  }

  Selectable<int> countWords() {
    return customSelect('select count(rowid) from Words;',
        variables: [],
        readsFrom: {words}).map((QueryRow row) => row.readInt('count(rowid)'));
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, meta];
}
