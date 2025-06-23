import 'package:drift/drift.dart';
import 'package:huldra/schema/knowledge_base.dart';

part 'words_dao.g.dart';

@DriftAccessor(tables: [Words])
class WordsDao extends DatabaseAccessor<KnowledgeBase> with _$WordsDaoMixin {
  WordsDao(super.db);
}
