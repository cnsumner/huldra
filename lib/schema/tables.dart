import 'package:moor/moor.dart';

part 'tables.g.dart';

class Messages extends Table {
  TextColumn get id => text()();
  TextColumn get author => text()();
  TextColumn get guild => text()();
  TextColumn get channel => text()();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Attachments extends Table {
  TextColumn get id => text()();
  TextColumn get guild => text()();
  TextColumn get channel => text()();
  TextColumn get url => text()();
  TextColumn get filename => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class MessageAttachments extends Table {
  TextColumn get messageId =>
      text().customConstraint('REFERENCES Messages(id)')();
  TextColumn get attachmentId =>
      text().customConstraint('REFERENCES Attachments(id)')();

  @override
  Set<Column> get primaryKey => {messageId, attachmentId};
}

@UseMoor(tables: [Messages, Attachments, MessageAttachments])
class RawData extends _$RawData {
  RawData(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<List<Message>> get allMessages => select(messages).get();

  Future<List<Attachment>> get allAttachments => select(attachments).get();

  Future<List<MessageAttachment>> get allMessageAttachments =>
      select(messageAttachments).get();

  Future<List<Message>> getPagedMessages(int pageSize, {String lastId = '0'}) {
    var greaterThan = CustomExpression<bool>('Id > $lastId');

    return (select(messages)
          ..orderBy(
              [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.asc)])
          ..where((tbl) => greaterThan)
          ..limit(pageSize))
        .get();
  }

  Future<void> insertMessage(Message message, List<Attachment> attachmentList,
      List<MessageAttachment> messageAttachmentList) {
    return transaction(() async {
      await into(messages).insert(message, mode: InsertMode.insert);

      await batch((batch) {
        batch.insertAll(attachments, attachmentList,
            mode: InsertMode.insertOrIgnore);
      });

      await batch((batch) {
        batch.insertAll(messageAttachments, messageAttachmentList,
            mode: InsertMode.insert);
      });
    });
  }

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      });
}
