import 'package:moor/moor.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'tables.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get author => text()();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime()();
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [Messages])
class Knowledgebase extends _$Knowledgebase {
  Knowledgebase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<List<Message>> get allmessages => select(messages).get();
}
