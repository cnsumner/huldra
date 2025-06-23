import 'package:drift/drift.dart';
import 'package:huldra/schema/DAOs/random_selection_dao.dart';
import 'package:huldra/schema/DAOs/words_dao.dart';
import 'package:huldra/schema/knowledge_base.steps.dart';

part 'knowledge_base.g.dart';

class Words extends Table {
  TextColumn get wordHash => text()();
  TextColumn get word => text()();
  IntColumn get totalOccurances => integer().clientDefault(() => 1)();
  IntColumn get msgOccurances => integer().clientDefault(() => 1)();

  @override
  Set<Column> get primaryKey => {wordHash};
}

class Prefixes extends Table {
  @ReferenceName('fk_prefixes_parent_words')
  TextColumn get wordHash => text().references(Words, #wordHash)();
  @ReferenceName('fk_prefixes_prefix_words')
  TextColumn get prefixHash => text().references(Words, #wordHash)();
  IntColumn get count => integer()();

  @override
  Set<Column> get primaryKey => {wordHash, prefixHash};
}

class Suffixes extends Table {
  @ReferenceName('fk_suffixes_parent_words')
  TextColumn get wordHash => text().references(Words, #wordHash)();
  @ReferenceName('fk_suffixes_suffix_words')
  TextColumn get suffixHash => text().references(Words, #wordHash)();
  IntColumn get count => integer()();

  @override
  Set<Column> get primaryKey => {wordHash, suffixHash};
}

class HeadDistances extends Table {
  TextColumn get wordHash => text().references(Words, #wordHash)();
  IntColumn get distance => integer()();
  IntColumn get count => integer()();

  @override
  Set<Column> get primaryKey => {wordHash, distance};
}

class TailDistances extends Table {
  TextColumn get wordHash => text().references(Words, #wordHash)();
  IntColumn get distance => integer()();
  IntColumn get count => integer()();

  @override
  Set<Column> get primaryKey => {wordHash, distance};
}

class Meta extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get msgCount => integer().withDefault(const Constant(0))();
  IntColumn get wordCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [Words, Prefixes, Suffixes, HeadDistances, TailDistances, Meta],
  queries: {
    'randomWord':
        'select * from Words where rowid = (abs(random()) % (select (select max(rowid) from Words)+1));',
    'countWords': 'select count(rowid) from Words;',
  },
  daos: [WordsDao, RandomSelectionDao],
)
class KnowledgeBase extends _$KnowledgeBase {
  KnowledgeBase(super.e);

  Future<Word> getWord(String wordHash) =>
      (select(words)..where((word) => word.wordHash.equals(wordHash))).getSingle();

  Future<List<Word>> getWords(List<String> hashes) =>
      (select(words)..where((word) => word.wordHash.isIn(hashes))).get();

  // create new word record or update existing one on conflict
  Future<Word> upsertWord(String hash, String word, {bool updateMsgCount = false}) async {
    return into(words).insertReturning(
      WordsCompanion.insert(wordHash: hash, word: word),
      onConflict: DoUpdate(
        (old) {
          return WordsCompanion.custom(
            totalOccurances: old.totalOccurances + const Constant(1),
            msgOccurances:
                old.msgOccurances + (updateMsgCount ? const Constant(1) : const Constant(0)),
          );
        },
      ),
    );
  }

  void upsertHeadDists(
    List<HeadDistancesCompanion> distances,
    Batch batch,
  ) {
    batch.insertAll(
      headDistances,
      distances,
      onConflict: DoUpdate<HeadDistances, HeadDistance>(
        (old) => HeadDistancesCompanion.custom(count: old.count + const Constant(1)),
      ),
    );
  }

  void upsertTailDists(
    List<TailDistancesCompanion> distances,
    Batch batch,
  ) {
    batch.insertAll<TailDistances, TailDistance>(
      tailDistances,
      distances,
      onConflict: DoUpdate(
        (old) => TailDistancesCompanion.custom(count: old.count + const Constant(1)),
      ),
    );
  }

  void upsertPrefixes(List<PrefixesCompanion> prefixes, Batch batch) {
    batch.insertAll<Prefixes, Prefixe>(
      this.prefixes,
      prefixes,
      onConflict: DoUpdate(
        (old) => PrefixesCompanion.custom(count: old.count + const Constant(1)),
      ),
    );
  }

  void upsertSuffixes(List<SuffixesCompanion> suffixes, Batch batch) {
    batch.insertAll<Suffixes, Suffixe>(
      this.suffixes,
      suffixes,
      onConflict: DoUpdate(
        (old) => SuffixesCompanion.custom(count: old.count + const Constant(1)),
      ),
    );
  }

  Future<List<Word>> queryWords(String word) =>
      (select(words)..where((tbl) => tbl.word.lower().equals(word.toLowerCase()))).get();

  Future<MetaData> getMetadata() {
    return select(meta).getSingle().onError((error, stackTrace) {
      return into(meta)
          .insert(const MetaData(id: 1, msgCount: 0, wordCount: 0))
          .then<MetaData>((_) => select(meta).getSingle());
    });
  }

  Future<List<({int dist, int weight})>> getHeadDistances(
    String wordHash, {
    OrderingMode order = OrderingMode.desc,
  }) {
    final query = select(headDistances)
      ..where((row) => row.wordHash.equals(wordHash))
      ..orderBy([(x) => OrderingTerm(expression: x.distance, mode: order)]);

    return query
        .map<({int dist, int weight})>((row) => (dist: row.distance, weight: row.count))
        .get();
  }

  Future<List<({int dist, int weight})>> getTailDistances(
    String wordHash, {
    OrderingMode order = OrderingMode.desc,
  }) {
    final query = select(tailDistances)
      ..where((row) => row.wordHash.equals(wordHash))
      ..orderBy([(x) => OrderingTerm(expression: x.distance, mode: order)]);

    return query
        .map<({int dist, int weight})>((row) => (dist: row.distance, weight: row.count))
        .get();
  }

  Future<List<Prefixe>> getPrefixes(String wordHash) {
    final query = select(prefixes)
      ..where((row) => row.wordHash.equals(wordHash))
      ..orderBy([(x) => OrderingTerm(expression: x.count, mode: OrderingMode.desc)]);

    return query.get();
  }

  Future<List<Suffixe>> getSuffixes(String wordHash) {
    final query = select(suffixes)
      ..where((row) => row.wordHash.equals(wordHash))
      ..orderBy([(x) => OrderingTerm(expression: x.count, mode: OrderingMode.desc)]);

    return query.get();
  }

  // increment metadata counters by the given values
  Future<void> updateMetadata({int msgCount = 0, int wordCount = 0}) => into(meta).insert(
    MetaCompanion.insert(
      id: const Value(1),
      msgCount: Value(msgCount),
      wordCount: Value(wordCount),
    ),
    onConflict: DoUpdate(
      (old) => MetaCompanion.custom(
        msgCount: old.msgCount + Constant(msgCount),
        wordCount: old.wordCount + Constant(wordCount),
      ),
    ),
  );

  Future clearKnowledgeBase() async {
    // clear all tables in the knowledge base
    await transaction(() async {
      await delete(prefixes).go();
      await delete(suffixes).go();
      await delete(headDistances).go();
      await delete(tailDistances).go();
      await delete(words).go();
      await delete(meta).go();
    });
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          await m.runMigrationSteps(
            from: from,
            to: to,
            steps: migrationSteps(
              from1To2: (m, schema) async {
                await m.createTable(schema.prefixes);
                await m.createTable(schema.suffixes);
                await m.createTable(schema.headDistances);
                await m.createTable(schema.tailDistances);
                // port json blobs to new tables
                await customInsert(
                  '''
                    insert into prefixes (word_hash, prefix_hash, count)
                    select w.word_hash, key as prefix_hash, value as count
                    from words as w, json_each(w.prefixes);
                    ''',
                  updates: {schema.prefixes},
                );
                await customInsert(
                  '''
                    insert into suffixes (word_hash, suffix_hash, count)
                    select w.word_hash, key as suffix_hash, value as count
                    from words as w, json_each(w.suffixes);
                    ''',
                  updates: {schema.suffixes},
                );
                await customInsert(
                  '''
                    insert into head_distances (word_hash, distance, count)
                    select w.word_hash, key as distance, value as count
                    from words as w, json_each(w.dist_from_head);
                    ''',
                  updates: {schema.headDistances},
                );
                await customInsert(
                  '''
                    insert into tail_distances (word_hash, distance, count)
                    select w.word_hash, key as distance, value as count
                    from words as w, json_each(w.dist_from_tail);
                    ''',
                  updates: {schema.tailDistances},
                );

                // Remove old json columns
                await m.alterTable(TableMigration(words));
              },
            ),
          );
        });

        // Fail if the migration broke foreign keys
        final wrongForeignKeys = await customSelect('PRAGMA foreign_key_check').get();
        assert(wrongForeignKeys.isEmpty, '${wrongForeignKeys.map((e) => e.data)}');

        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}
