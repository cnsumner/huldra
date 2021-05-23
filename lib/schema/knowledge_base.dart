import 'package:huldra/converters/word_converters.dart';
import 'package:moor/moor.dart';

part 'knowledge_base.g.dart';

class Words extends Table {
  TextColumn get wordHash => text()();
  TextColumn get word => text()();
  TextColumn get prefixes => text().map(const StringIntMapConverter())();
  TextColumn get suffixes => text().map(const StringIntMapConverter())();
  TextColumn get distFromHead => text().map(const IntIntMapConverter())();
  TextColumn get distFromTail => text().map(const IntIntMapConverter())();
  IntColumn get totalOccurances => integer()();
  IntColumn get msgOccurances => integer()();

  @override
  Set<Column> get primaryKey => {wordHash};
}

class Meta extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get msgCount => integer().withDefault(const Constant(0))();
  IntColumn get wordCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [
  Words,
  Meta
], queries: {
  'randomWord':
      'select * from Words where rowid = (abs(random()) % (select (select max(rowid) from Words)+1));',
  'countWords': 'select count(rowid) from Words;'
})
class KnowledgeBase extends _$KnowledgeBase {
  KnowledgeBase(QueryExecutor e) : super(e);

  Future<Word> getWord(String wordHash) =>
      (select(words)..where((word) => word.wordHash.equals(wordHash)))
          .getSingle();

  Future<List<Word>> getWords(List<String> hashes) =>
      (select(words)..where((word) => word.wordHash.isIn(hashes))).get();

  Future<int> putWord(Word word) => into(words).insert(word);

  Future<void> updateWord(Word word) =>
      into(words).insertOnConflictUpdate(word);

  Future<void> updateWords(List<Word> updates) => batch((batch) {
        batch.insertAllOnConflictUpdate(words, updates);
      });

  Future<List<Word>> queryWords(String word) => (select(words)
        ..where((tbl) => tbl.word.lower().equals(word.toLowerCase())))
      .get();

  Future<MetaData> getMetadata() async {
    return select(meta).getSingle().onError((error, stackTrace) {
      return into(meta)
          .insert(MetaData(id: 1, msgCount: 0, wordCount: 0))
          .then<MetaData>((_) => select(meta).getSingle());
    });
  }

  Future<void> updateMetadata(MetaData markovData) =>
      into(meta).insertOnConflictUpdate(markovData);

  Future clearKnowledgeBase() {
    return Future.wait([delete(words).go(), delete(meta).go()]);
  }

  @override
  int get schemaVersion => 1;
}
