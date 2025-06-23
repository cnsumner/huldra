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
  static const VerificationMeta _totalOccurancesMeta = const VerificationMeta(
    'totalOccurances',
  );
  @override
  late final GeneratedColumn<int> totalOccurances = GeneratedColumn<int>(
    'total_occurances',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 1,
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
    requiredDuringInsert: false,
    clientDefault: () => 1,
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
    }
    if (data.containsKey('msg_occurances')) {
      context.handle(
        _msgOccurancesMeta,
        msgOccurances.isAcceptableOrUnknown(
          data['msg_occurances']!,
          _msgOccurancesMeta,
        ),
      );
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
}

class Word extends DataClass implements Insertable<Word> {
  final String wordHash;
  final String word;
  final int totalOccurances;
  final int msgOccurances;
  const Word({
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

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
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

  Word copyWith({
    String? wordHash,
    String? word,
    int? totalOccurances,
    int? msgOccurances,
  }) => Word(
    wordHash: wordHash ?? this.wordHash,
    word: word ?? this.word,
    totalOccurances: totalOccurances ?? this.totalOccurances,
    msgOccurances: msgOccurances ?? this.msgOccurances,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
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
    return (StringBuffer('Word(')
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
      (other is Word &&
          other.wordHash == this.wordHash &&
          other.word == this.word &&
          other.totalOccurances == this.totalOccurances &&
          other.msgOccurances == this.msgOccurances);
}

class WordsCompanion extends UpdateCompanion<Word> {
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
    this.totalOccurances = const Value.absent(),
    this.msgOccurances = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : wordHash = Value(wordHash),
       word = Value(word);
  static Insertable<Word> custom({
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

class $PrefixesTable extends Prefixes with TableInfo<$PrefixesTable, Prefixe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrefixesTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  static const VerificationMeta _prefixHashMeta = const VerificationMeta(
    'prefixHash',
  );
  @override
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
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<Prefixe> instance, {
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
    if (data.containsKey('prefix_hash')) {
      context.handle(
        _prefixHashMeta,
        prefixHash.isAcceptableOrUnknown(data['prefix_hash']!, _prefixHashMeta),
      );
    } else if (isInserting) {
      context.missing(_prefixHashMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, prefixHash};
  @override
  Prefixe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prefixe(
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
  $PrefixesTable createAlias(String alias) {
    return $PrefixesTable(attachedDatabase, alias);
  }
}

class Prefixe extends DataClass implements Insertable<Prefixe> {
  final String wordHash;
  final String prefixHash;
  final int count;
  const Prefixe({
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

  factory Prefixe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prefixe(
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

  Prefixe copyWith({String? wordHash, String? prefixHash, int? count}) =>
      Prefixe(
        wordHash: wordHash ?? this.wordHash,
        prefixHash: prefixHash ?? this.prefixHash,
        count: count ?? this.count,
      );
  Prefixe copyWithCompanion(PrefixesCompanion data) {
    return Prefixe(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      prefixHash: data.prefixHash.present
          ? data.prefixHash.value
          : this.prefixHash,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Prefixe(')
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
      (other is Prefixe &&
          other.wordHash == this.wordHash &&
          other.prefixHash == this.prefixHash &&
          other.count == this.count);
}

class PrefixesCompanion extends UpdateCompanion<Prefixe> {
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
  static Insertable<Prefixe> custom({
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

class $SuffixesTable extends Suffixes with TableInfo<$SuffixesTable, Suffixe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuffixesTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  static const VerificationMeta _suffixHashMeta = const VerificationMeta(
    'suffixHash',
  );
  @override
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
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<Suffixe> instance, {
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
    if (data.containsKey('suffix_hash')) {
      context.handle(
        _suffixHashMeta,
        suffixHash.isAcceptableOrUnknown(data['suffix_hash']!, _suffixHashMeta),
      );
    } else if (isInserting) {
      context.missing(_suffixHashMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, suffixHash};
  @override
  Suffixe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Suffixe(
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
  $SuffixesTable createAlias(String alias) {
    return $SuffixesTable(attachedDatabase, alias);
  }
}

class Suffixe extends DataClass implements Insertable<Suffixe> {
  final String wordHash;
  final String suffixHash;
  final int count;
  const Suffixe({
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

  factory Suffixe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Suffixe(
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

  Suffixe copyWith({String? wordHash, String? suffixHash, int? count}) =>
      Suffixe(
        wordHash: wordHash ?? this.wordHash,
        suffixHash: suffixHash ?? this.suffixHash,
        count: count ?? this.count,
      );
  Suffixe copyWithCompanion(SuffixesCompanion data) {
    return Suffixe(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      suffixHash: data.suffixHash.present
          ? data.suffixHash.value
          : this.suffixHash,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Suffixe(')
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
      (other is Suffixe &&
          other.wordHash == this.wordHash &&
          other.suffixHash == this.suffixHash &&
          other.count == this.count);
}

class SuffixesCompanion extends UpdateCompanion<Suffixe> {
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
  static Insertable<Suffixe> custom({
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

class $HeadDistancesTable extends HeadDistances
    with TableInfo<$HeadDistancesTable, HeadDistance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeadDistancesTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<HeadDistance> instance, {
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
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, distance};
  @override
  HeadDistance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeadDistance(
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
  $HeadDistancesTable createAlias(String alias) {
    return $HeadDistancesTable(attachedDatabase, alias);
  }
}

class HeadDistance extends DataClass implements Insertable<HeadDistance> {
  final String wordHash;
  final int distance;
  final int count;
  const HeadDistance({
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

  factory HeadDistance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeadDistance(
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

  HeadDistance copyWith({String? wordHash, int? distance, int? count}) =>
      HeadDistance(
        wordHash: wordHash ?? this.wordHash,
        distance: distance ?? this.distance,
        count: count ?? this.count,
      );
  HeadDistance copyWithCompanion(HeadDistancesCompanion data) {
    return HeadDistance(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      distance: data.distance.present ? data.distance.value : this.distance,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeadDistance(')
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
      (other is HeadDistance &&
          other.wordHash == this.wordHash &&
          other.distance == this.distance &&
          other.count == this.count);
}

class HeadDistancesCompanion extends UpdateCompanion<HeadDistance> {
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
  static Insertable<HeadDistance> custom({
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

class $TailDistancesTable extends TailDistances
    with TableInfo<$TailDistancesTable, TailDistance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TailDistancesTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES words (word_hash)',
    ),
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<TailDistance> instance, {
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
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordHash, distance};
  @override
  TailDistance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TailDistance(
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
  $TailDistancesTable createAlias(String alias) {
    return $TailDistancesTable(attachedDatabase, alias);
  }
}

class TailDistance extends DataClass implements Insertable<TailDistance> {
  final String wordHash;
  final int distance;
  final int count;
  const TailDistance({
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

  factory TailDistance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TailDistance(
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

  TailDistance copyWith({String? wordHash, int? distance, int? count}) =>
      TailDistance(
        wordHash: wordHash ?? this.wordHash,
        distance: distance ?? this.distance,
        count: count ?? this.count,
      );
  TailDistance copyWithCompanion(TailDistancesCompanion data) {
    return TailDistance(
      wordHash: data.wordHash.present ? data.wordHash.value : this.wordHash,
      distance: data.distance.present ? data.distance.value : this.distance,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TailDistance(')
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
      (other is TailDistance &&
          other.wordHash == this.wordHash &&
          other.distance == this.distance &&
          other.count == this.count);
}

class TailDistancesCompanion extends UpdateCompanion<TailDistance> {
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
  static Insertable<TailDistance> custom({
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
  late final $PrefixesTable prefixes = $PrefixesTable(this);
  late final $SuffixesTable suffixes = $SuffixesTable(this);
  late final $HeadDistancesTable headDistances = $HeadDistancesTable(this);
  late final $TailDistancesTable tailDistances = $TailDistancesTable(this);
  late final $MetaTable meta = $MetaTable(this);
  late final WordsDao wordsDao = WordsDao(this as KnowledgeBase);
  late final RandomSelectionDao randomSelectionDao = RandomSelectionDao(
    this as KnowledgeBase,
  );
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
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    words,
    prefixes,
    suffixes,
    headDistances,
    tailDistances,
    meta,
  ];
}

typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      required String wordHash,
      required String word,
      Value<int> totalOccurances,
      Value<int> msgOccurances,
      Value<int> rowid,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<String> wordHash,
      Value<String> word,
      Value<int> totalOccurances,
      Value<int> msgOccurances,
      Value<int> rowid,
    });

final class $$WordsTableReferences
    extends BaseReferences<_$KnowledgeBase, $WordsTable, Word> {
  $$WordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PrefixesTable, List<Prefixe>>
  _fk_prefixes_parent_wordsTable(_$KnowledgeBase db) =>
      MultiTypedResultKey.fromTable(
        db.prefixes,
        aliasName: $_aliasNameGenerator(
          db.words.wordHash,
          db.prefixes.wordHash,
        ),
      );

  $$PrefixesTableProcessedTableManager get fk_prefixes_parent_words {
    final manager = $$PrefixesTableTableManager($_db, $_db.prefixes).filter(
      (f) => f.wordHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _fk_prefixes_parent_wordsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PrefixesTable, List<Prefixe>>
  _fk_prefixes_prefix_wordsTable(_$KnowledgeBase db) =>
      MultiTypedResultKey.fromTable(
        db.prefixes,
        aliasName: $_aliasNameGenerator(
          db.words.wordHash,
          db.prefixes.prefixHash,
        ),
      );

  $$PrefixesTableProcessedTableManager get fk_prefixes_prefix_words {
    final manager = $$PrefixesTableTableManager($_db, $_db.prefixes).filter(
      (f) =>
          f.prefixHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _fk_prefixes_prefix_wordsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SuffixesTable, List<Suffixe>>
  _fk_suffixes_parent_wordsTable(_$KnowledgeBase db) =>
      MultiTypedResultKey.fromTable(
        db.suffixes,
        aliasName: $_aliasNameGenerator(
          db.words.wordHash,
          db.suffixes.wordHash,
        ),
      );

  $$SuffixesTableProcessedTableManager get fk_suffixes_parent_words {
    final manager = $$SuffixesTableTableManager($_db, $_db.suffixes).filter(
      (f) => f.wordHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _fk_suffixes_parent_wordsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SuffixesTable, List<Suffixe>>
  _fk_suffixes_suffix_wordsTable(_$KnowledgeBase db) =>
      MultiTypedResultKey.fromTable(
        db.suffixes,
        aliasName: $_aliasNameGenerator(
          db.words.wordHash,
          db.suffixes.suffixHash,
        ),
      );

  $$SuffixesTableProcessedTableManager get fk_suffixes_suffix_words {
    final manager = $$SuffixesTableTableManager($_db, $_db.suffixes).filter(
      (f) =>
          f.suffixHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _fk_suffixes_suffix_wordsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HeadDistancesTable, List<HeadDistance>>
  _headDistancesRefsTable(_$KnowledgeBase db) => MultiTypedResultKey.fromTable(
    db.headDistances,
    aliasName: $_aliasNameGenerator(
      db.words.wordHash,
      db.headDistances.wordHash,
    ),
  );

  $$HeadDistancesTableProcessedTableManager get headDistancesRefs {
    final manager = $$HeadDistancesTableTableManager($_db, $_db.headDistances)
        .filter(
          (f) =>
              f.wordHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
        );

    final cache = $_typedResult.readTableOrNull(_headDistancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TailDistancesTable, List<TailDistance>>
  _tailDistancesRefsTable(_$KnowledgeBase db) => MultiTypedResultKey.fromTable(
    db.tailDistances,
    aliasName: $_aliasNameGenerator(
      db.words.wordHash,
      db.tailDistances.wordHash,
    ),
  );

  $$TailDistancesTableProcessedTableManager get tailDistancesRefs {
    final manager = $$TailDistancesTableTableManager($_db, $_db.tailDistances)
        .filter(
          (f) =>
              f.wordHash.wordHash.sqlEquals($_itemColumn<String>('word_hash')!),
        );

    final cache = $_typedResult.readTableOrNull(_tailDistancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<int> get totalOccurances => $composableBuilder(
    column: $table.totalOccurances,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get msgOccurances => $composableBuilder(
    column: $table.msgOccurances,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> fk_prefixes_parent_words(
    Expression<bool> Function($$PrefixesTableFilterComposer f) f,
  ) {
    final $$PrefixesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.prefixes,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrefixesTableFilterComposer(
            $db: $db,
            $table: $db.prefixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fk_prefixes_prefix_words(
    Expression<bool> Function($$PrefixesTableFilterComposer f) f,
  ) {
    final $$PrefixesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.prefixes,
      getReferencedColumn: (t) => t.prefixHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrefixesTableFilterComposer(
            $db: $db,
            $table: $db.prefixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fk_suffixes_parent_words(
    Expression<bool> Function($$SuffixesTableFilterComposer f) f,
  ) {
    final $$SuffixesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.suffixes,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuffixesTableFilterComposer(
            $db: $db,
            $table: $db.suffixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fk_suffixes_suffix_words(
    Expression<bool> Function($$SuffixesTableFilterComposer f) f,
  ) {
    final $$SuffixesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.suffixes,
      getReferencedColumn: (t) => t.suffixHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuffixesTableFilterComposer(
            $db: $db,
            $table: $db.suffixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> headDistancesRefs(
    Expression<bool> Function($$HeadDistancesTableFilterComposer f) f,
  ) {
    final $$HeadDistancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.headDistances,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadDistancesTableFilterComposer(
            $db: $db,
            $table: $db.headDistances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tailDistancesRefs(
    Expression<bool> Function($$TailDistancesTableFilterComposer f) f,
  ) {
    final $$TailDistancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.tailDistances,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TailDistancesTableFilterComposer(
            $db: $db,
            $table: $db.tailDistances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  GeneratedColumn<int> get totalOccurances => $composableBuilder(
    column: $table.totalOccurances,
    builder: (column) => column,
  );

  GeneratedColumn<int> get msgOccurances => $composableBuilder(
    column: $table.msgOccurances,
    builder: (column) => column,
  );

  Expression<T> fk_prefixes_parent_words<T extends Object>(
    Expression<T> Function($$PrefixesTableAnnotationComposer a) f,
  ) {
    final $$PrefixesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.prefixes,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrefixesTableAnnotationComposer(
            $db: $db,
            $table: $db.prefixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> fk_prefixes_prefix_words<T extends Object>(
    Expression<T> Function($$PrefixesTableAnnotationComposer a) f,
  ) {
    final $$PrefixesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.prefixes,
      getReferencedColumn: (t) => t.prefixHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrefixesTableAnnotationComposer(
            $db: $db,
            $table: $db.prefixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> fk_suffixes_parent_words<T extends Object>(
    Expression<T> Function($$SuffixesTableAnnotationComposer a) f,
  ) {
    final $$SuffixesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.suffixes,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuffixesTableAnnotationComposer(
            $db: $db,
            $table: $db.suffixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> fk_suffixes_suffix_words<T extends Object>(
    Expression<T> Function($$SuffixesTableAnnotationComposer a) f,
  ) {
    final $$SuffixesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.suffixes,
      getReferencedColumn: (t) => t.suffixHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuffixesTableAnnotationComposer(
            $db: $db,
            $table: $db.suffixes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> headDistancesRefs<T extends Object>(
    Expression<T> Function($$HeadDistancesTableAnnotationComposer a) f,
  ) {
    final $$HeadDistancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.headDistances,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadDistancesTableAnnotationComposer(
            $db: $db,
            $table: $db.headDistances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tailDistancesRefs<T extends Object>(
    Expression<T> Function($$TailDistancesTableAnnotationComposer a) f,
  ) {
    final $$TailDistancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.tailDistances,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TailDistancesTableAnnotationComposer(
            $db: $db,
            $table: $db.tailDistances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Word, $$WordsTableReferences),
          Word,
          PrefetchHooks Function({
            bool fk_prefixes_parent_words,
            bool fk_prefixes_prefix_words,
            bool fk_suffixes_parent_words,
            bool fk_suffixes_suffix_words,
            bool headDistancesRefs,
            bool tailDistancesRefs,
          })
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
                Value<int> totalOccurances = const Value.absent(),
                Value<int> msgOccurances = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion(
                wordHash: wordHash,
                word: word,
                totalOccurances: totalOccurances,
                msgOccurances: msgOccurances,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required String word,
                Value<int> totalOccurances = const Value.absent(),
                Value<int> msgOccurances = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion.insert(
                wordHash: wordHash,
                word: word,
                totalOccurances: totalOccurances,
                msgOccurances: msgOccurances,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$WordsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                fk_prefixes_parent_words = false,
                fk_prefixes_prefix_words = false,
                fk_suffixes_parent_words = false,
                fk_suffixes_suffix_words = false,
                headDistancesRefs = false,
                tailDistancesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fk_prefixes_parent_words) db.prefixes,
                    if (fk_prefixes_prefix_words) db.prefixes,
                    if (fk_suffixes_parent_words) db.suffixes,
                    if (fk_suffixes_suffix_words) db.suffixes,
                    if (headDistancesRefs) db.headDistances,
                    if (tailDistancesRefs) db.tailDistances,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fk_prefixes_parent_words)
                        await $_getPrefetchedData<Word, $WordsTable, Prefixe>(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._fk_prefixes_parent_wordsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).fk_prefixes_parent_words,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.wordHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                      if (fk_prefixes_prefix_words)
                        await $_getPrefetchedData<Word, $WordsTable, Prefixe>(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._fk_prefixes_prefix_wordsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).fk_prefixes_prefix_words,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.prefixHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                      if (fk_suffixes_parent_words)
                        await $_getPrefetchedData<Word, $WordsTable, Suffixe>(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._fk_suffixes_parent_wordsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).fk_suffixes_parent_words,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.wordHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                      if (fk_suffixes_suffix_words)
                        await $_getPrefetchedData<Word, $WordsTable, Suffixe>(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._fk_suffixes_suffix_wordsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).fk_suffixes_suffix_words,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.suffixHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                      if (headDistancesRefs)
                        await $_getPrefetchedData<
                          Word,
                          $WordsTable,
                          HeadDistance
                        >(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._headDistancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).headDistancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.wordHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                      if (tailDistancesRefs)
                        await $_getPrefetchedData<
                          Word,
                          $WordsTable,
                          TailDistance
                        >(
                          currentTable: table,
                          referencedTable: $$WordsTableReferences
                              ._tailDistancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WordsTableReferences(
                                db,
                                table,
                                p0,
                              ).tailDistancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.wordHash == item.wordHash,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
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
      (Word, $$WordsTableReferences),
      Word,
      PrefetchHooks Function({
        bool fk_prefixes_parent_words,
        bool fk_prefixes_prefix_words,
        bool fk_suffixes_parent_words,
        bool fk_suffixes_suffix_words,
        bool headDistancesRefs,
        bool tailDistancesRefs,
      })
    >;
typedef $$PrefixesTableCreateCompanionBuilder =
    PrefixesCompanion Function({
      required String wordHash,
      required String prefixHash,
      required int count,
      Value<int> rowid,
    });
typedef $$PrefixesTableUpdateCompanionBuilder =
    PrefixesCompanion Function({
      Value<String> wordHash,
      Value<String> prefixHash,
      Value<int> count,
      Value<int> rowid,
    });

final class $$PrefixesTableReferences
    extends BaseReferences<_$KnowledgeBase, $PrefixesTable, Prefixe> {
  $$PrefixesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WordsTable _wordHashTable(_$KnowledgeBase db) => db.words.createAlias(
    $_aliasNameGenerator(db.prefixes.wordHash, db.words.wordHash),
  );

  $$WordsTableProcessedTableManager get wordHash {
    final $_column = $_itemColumn<String>('word_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WordsTable _prefixHashTable(_$KnowledgeBase db) =>
      db.words.createAlias(
        $_aliasNameGenerator(db.prefixes.prefixHash, db.words.wordHash),
      );

  $$WordsTableProcessedTableManager get prefixHash {
    final $_column = $_itemColumn<String>('prefix_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_prefixHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PrefixesTableFilterComposer
    extends Composer<_$KnowledgeBase, $PrefixesTable> {
  $$PrefixesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$WordsTableFilterComposer get wordHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableFilterComposer get prefixHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prefixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrefixesTableOrderingComposer
    extends Composer<_$KnowledgeBase, $PrefixesTable> {
  $$PrefixesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$WordsTableOrderingComposer get wordHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableOrderingComposer get prefixHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prefixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrefixesTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $PrefixesTable> {
  $$PrefixesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$WordsTableAnnotationComposer get wordHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableAnnotationComposer get prefixHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prefixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrefixesTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $PrefixesTable,
          Prefixe,
          $$PrefixesTableFilterComposer,
          $$PrefixesTableOrderingComposer,
          $$PrefixesTableAnnotationComposer,
          $$PrefixesTableCreateCompanionBuilder,
          $$PrefixesTableUpdateCompanionBuilder,
          (Prefixe, $$PrefixesTableReferences),
          Prefixe,
          PrefetchHooks Function({bool wordHash, bool prefixHash})
        > {
  $$PrefixesTableTableManager(_$KnowledgeBase db, $PrefixesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrefixesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrefixesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrefixesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordHash = const Value.absent(),
                Value<String> prefixHash = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrefixesCompanion(
                wordHash: wordHash,
                prefixHash: prefixHash,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required String prefixHash,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => PrefixesCompanion.insert(
                wordHash: wordHash,
                prefixHash: prefixHash,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PrefixesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({wordHash = false, prefixHash = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (wordHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.wordHash,
                                referencedTable: $$PrefixesTableReferences
                                    ._wordHashTable(db),
                                referencedColumn: $$PrefixesTableReferences
                                    ._wordHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }
                    if (prefixHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.prefixHash,
                                referencedTable: $$PrefixesTableReferences
                                    ._prefixHashTable(db),
                                referencedColumn: $$PrefixesTableReferences
                                    ._prefixHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PrefixesTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $PrefixesTable,
      Prefixe,
      $$PrefixesTableFilterComposer,
      $$PrefixesTableOrderingComposer,
      $$PrefixesTableAnnotationComposer,
      $$PrefixesTableCreateCompanionBuilder,
      $$PrefixesTableUpdateCompanionBuilder,
      (Prefixe, $$PrefixesTableReferences),
      Prefixe,
      PrefetchHooks Function({bool wordHash, bool prefixHash})
    >;
typedef $$SuffixesTableCreateCompanionBuilder =
    SuffixesCompanion Function({
      required String wordHash,
      required String suffixHash,
      required int count,
      Value<int> rowid,
    });
typedef $$SuffixesTableUpdateCompanionBuilder =
    SuffixesCompanion Function({
      Value<String> wordHash,
      Value<String> suffixHash,
      Value<int> count,
      Value<int> rowid,
    });

final class $$SuffixesTableReferences
    extends BaseReferences<_$KnowledgeBase, $SuffixesTable, Suffixe> {
  $$SuffixesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WordsTable _wordHashTable(_$KnowledgeBase db) => db.words.createAlias(
    $_aliasNameGenerator(db.suffixes.wordHash, db.words.wordHash),
  );

  $$WordsTableProcessedTableManager get wordHash {
    final $_column = $_itemColumn<String>('word_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WordsTable _suffixHashTable(_$KnowledgeBase db) =>
      db.words.createAlias(
        $_aliasNameGenerator(db.suffixes.suffixHash, db.words.wordHash),
      );

  $$WordsTableProcessedTableManager get suffixHash {
    final $_column = $_itemColumn<String>('suffix_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_suffixHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SuffixesTableFilterComposer
    extends Composer<_$KnowledgeBase, $SuffixesTable> {
  $$SuffixesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$WordsTableFilterComposer get wordHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableFilterComposer get suffixHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.suffixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SuffixesTableOrderingComposer
    extends Composer<_$KnowledgeBase, $SuffixesTable> {
  $$SuffixesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$WordsTableOrderingComposer get wordHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableOrderingComposer get suffixHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.suffixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SuffixesTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $SuffixesTable> {
  $$SuffixesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$WordsTableAnnotationComposer get wordHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WordsTableAnnotationComposer get suffixHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.suffixHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SuffixesTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $SuffixesTable,
          Suffixe,
          $$SuffixesTableFilterComposer,
          $$SuffixesTableOrderingComposer,
          $$SuffixesTableAnnotationComposer,
          $$SuffixesTableCreateCompanionBuilder,
          $$SuffixesTableUpdateCompanionBuilder,
          (Suffixe, $$SuffixesTableReferences),
          Suffixe,
          PrefetchHooks Function({bool wordHash, bool suffixHash})
        > {
  $$SuffixesTableTableManager(_$KnowledgeBase db, $SuffixesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuffixesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuffixesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuffixesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordHash = const Value.absent(),
                Value<String> suffixHash = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SuffixesCompanion(
                wordHash: wordHash,
                suffixHash: suffixHash,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required String suffixHash,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => SuffixesCompanion.insert(
                wordHash: wordHash,
                suffixHash: suffixHash,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SuffixesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({wordHash = false, suffixHash = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (wordHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.wordHash,
                                referencedTable: $$SuffixesTableReferences
                                    ._wordHashTable(db),
                                referencedColumn: $$SuffixesTableReferences
                                    ._wordHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }
                    if (suffixHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.suffixHash,
                                referencedTable: $$SuffixesTableReferences
                                    ._suffixHashTable(db),
                                referencedColumn: $$SuffixesTableReferences
                                    ._suffixHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SuffixesTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $SuffixesTable,
      Suffixe,
      $$SuffixesTableFilterComposer,
      $$SuffixesTableOrderingComposer,
      $$SuffixesTableAnnotationComposer,
      $$SuffixesTableCreateCompanionBuilder,
      $$SuffixesTableUpdateCompanionBuilder,
      (Suffixe, $$SuffixesTableReferences),
      Suffixe,
      PrefetchHooks Function({bool wordHash, bool suffixHash})
    >;
typedef $$HeadDistancesTableCreateCompanionBuilder =
    HeadDistancesCompanion Function({
      required String wordHash,
      required int distance,
      required int count,
      Value<int> rowid,
    });
typedef $$HeadDistancesTableUpdateCompanionBuilder =
    HeadDistancesCompanion Function({
      Value<String> wordHash,
      Value<int> distance,
      Value<int> count,
      Value<int> rowid,
    });

final class $$HeadDistancesTableReferences
    extends BaseReferences<_$KnowledgeBase, $HeadDistancesTable, HeadDistance> {
  $$HeadDistancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WordsTable _wordHashTable(_$KnowledgeBase db) => db.words.createAlias(
    $_aliasNameGenerator(db.headDistances.wordHash, db.words.wordHash),
  );

  $$WordsTableProcessedTableManager get wordHash {
    final $_column = $_itemColumn<String>('word_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HeadDistancesTableFilterComposer
    extends Composer<_$KnowledgeBase, $HeadDistancesTable> {
  $$HeadDistancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$WordsTableFilterComposer get wordHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeadDistancesTableOrderingComposer
    extends Composer<_$KnowledgeBase, $HeadDistancesTable> {
  $$HeadDistancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$WordsTableOrderingComposer get wordHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeadDistancesTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $HeadDistancesTable> {
  $$HeadDistancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$WordsTableAnnotationComposer get wordHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeadDistancesTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $HeadDistancesTable,
          HeadDistance,
          $$HeadDistancesTableFilterComposer,
          $$HeadDistancesTableOrderingComposer,
          $$HeadDistancesTableAnnotationComposer,
          $$HeadDistancesTableCreateCompanionBuilder,
          $$HeadDistancesTableUpdateCompanionBuilder,
          (HeadDistance, $$HeadDistancesTableReferences),
          HeadDistance,
          PrefetchHooks Function({bool wordHash})
        > {
  $$HeadDistancesTableTableManager(
    _$KnowledgeBase db,
    $HeadDistancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HeadDistancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HeadDistancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HeadDistancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordHash = const Value.absent(),
                Value<int> distance = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HeadDistancesCompanion(
                wordHash: wordHash,
                distance: distance,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required int distance,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => HeadDistancesCompanion.insert(
                wordHash: wordHash,
                distance: distance,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HeadDistancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({wordHash = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (wordHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.wordHash,
                                referencedTable: $$HeadDistancesTableReferences
                                    ._wordHashTable(db),
                                referencedColumn: $$HeadDistancesTableReferences
                                    ._wordHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HeadDistancesTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $HeadDistancesTable,
      HeadDistance,
      $$HeadDistancesTableFilterComposer,
      $$HeadDistancesTableOrderingComposer,
      $$HeadDistancesTableAnnotationComposer,
      $$HeadDistancesTableCreateCompanionBuilder,
      $$HeadDistancesTableUpdateCompanionBuilder,
      (HeadDistance, $$HeadDistancesTableReferences),
      HeadDistance,
      PrefetchHooks Function({bool wordHash})
    >;
typedef $$TailDistancesTableCreateCompanionBuilder =
    TailDistancesCompanion Function({
      required String wordHash,
      required int distance,
      required int count,
      Value<int> rowid,
    });
typedef $$TailDistancesTableUpdateCompanionBuilder =
    TailDistancesCompanion Function({
      Value<String> wordHash,
      Value<int> distance,
      Value<int> count,
      Value<int> rowid,
    });

final class $$TailDistancesTableReferences
    extends BaseReferences<_$KnowledgeBase, $TailDistancesTable, TailDistance> {
  $$TailDistancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WordsTable _wordHashTable(_$KnowledgeBase db) => db.words.createAlias(
    $_aliasNameGenerator(db.tailDistances.wordHash, db.words.wordHash),
  );

  $$WordsTableProcessedTableManager get wordHash {
    final $_column = $_itemColumn<String>('word_hash')!;

    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.wordHash.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordHashTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TailDistancesTableFilterComposer
    extends Composer<_$KnowledgeBase, $TailDistancesTable> {
  $$TailDistancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$WordsTableFilterComposer get wordHash {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TailDistancesTableOrderingComposer
    extends Composer<_$KnowledgeBase, $TailDistancesTable> {
  $$TailDistancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$WordsTableOrderingComposer get wordHash {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableOrderingComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TailDistancesTableAnnotationComposer
    extends Composer<_$KnowledgeBase, $TailDistancesTable> {
  $$TailDistancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$WordsTableAnnotationComposer get wordHash {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.wordHash,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.wordHash,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TailDistancesTableTableManager
    extends
        RootTableManager<
          _$KnowledgeBase,
          $TailDistancesTable,
          TailDistance,
          $$TailDistancesTableFilterComposer,
          $$TailDistancesTableOrderingComposer,
          $$TailDistancesTableAnnotationComposer,
          $$TailDistancesTableCreateCompanionBuilder,
          $$TailDistancesTableUpdateCompanionBuilder,
          (TailDistance, $$TailDistancesTableReferences),
          TailDistance,
          PrefetchHooks Function({bool wordHash})
        > {
  $$TailDistancesTableTableManager(
    _$KnowledgeBase db,
    $TailDistancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TailDistancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TailDistancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TailDistancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordHash = const Value.absent(),
                Value<int> distance = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TailDistancesCompanion(
                wordHash: wordHash,
                distance: distance,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordHash,
                required int distance,
                required int count,
                Value<int> rowid = const Value.absent(),
              }) => TailDistancesCompanion.insert(
                wordHash: wordHash,
                distance: distance,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TailDistancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({wordHash = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (wordHash) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.wordHash,
                                referencedTable: $$TailDistancesTableReferences
                                    ._wordHashTable(db),
                                referencedColumn: $$TailDistancesTableReferences
                                    ._wordHashTable(db)
                                    .wordHash,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TailDistancesTableProcessedTableManager =
    ProcessedTableManager<
      _$KnowledgeBase,
      $TailDistancesTable,
      TailDistance,
      $$TailDistancesTableFilterComposer,
      $$TailDistancesTableOrderingComposer,
      $$TailDistancesTableAnnotationComposer,
      $$TailDistancesTableCreateCompanionBuilder,
      $$TailDistancesTableUpdateCompanionBuilder,
      (TailDistance, $$TailDistancesTableReferences),
      TailDistance,
      PrefetchHooks Function({bool wordHash})
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
  $$PrefixesTableTableManager get prefixes =>
      $$PrefixesTableTableManager(_db, _db.prefixes);
  $$SuffixesTableTableManager get suffixes =>
      $$SuffixesTableTableManager(_db, _db.suffixes);
  $$HeadDistancesTableTableManager get headDistances =>
      $$HeadDistancesTableTableManager(_db, _db.headDistances);
  $$TailDistancesTableTableManager get tailDistances =>
      $$TailDistancesTableTableManager(_db, _db.tailDistances);
  $$MetaTableTableManager get meta => $$MetaTableTableManager(_db, _db.meta);
}
