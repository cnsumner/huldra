// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:test/test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = KnowledgeBase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test('migration from v1 to v2 does not corrupt data', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldWordsData = <v1.WordsData>[
      const v1.WordsData(
        wordHash: 'word1_hash',
        word: 'example',
        prefixes: '{"word2_hash": 1}',
        suffixes: '{"word2_hash": 1}',
        distFromHead: '{"0": 1, "1": 1}',
        distFromTail: '{"0": 1, "1": 1}',
        totalOccurances: 2,
        msgOccurances: 2,
      ),
      const v1.WordsData(
        wordHash: 'word2_hash',
        word: 'another_example',
        prefixes: '{"word1_hash": 1}',
        suffixes: '{"word1_hash": 1}',
        distFromHead: '{"0": 1, "1": 1}',
        distFromTail: '{"0": 1, "1": 1}',
        totalOccurances: 2,
        msgOccurances: 2,
      ),
    ];
    final expectedNewWordsData = <v2.WordsData>[
      const v2.WordsData(
        wordHash: 'word1_hash',
        word: 'example',
        totalOccurances: 2,
        msgOccurances: 2,
      ),
      const v2.WordsData(
        wordHash: 'word2_hash',
        word: 'another_example',
        totalOccurances: 2,
        msgOccurances: 2,
      ),
    ];
    final oldMetaData = <v1.MetaData>[
      const v1.MetaData(
        id: 1,
        msgCount: 2,
        wordCount: 2,
      ),
    ];
    final expectedNewMetaData = <v2.MetaData>[
      const v2.MetaData(
        id: 1,
        msgCount: 2,
        wordCount: 2,
      ),
    ];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: KnowledgeBase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.words, oldWordsData);
        batch.insertAll(oldDb.meta, oldMetaData);
      },
      validateItems: (newDb) async {
        expect(expectedNewWordsData, await newDb.select(newDb.words).get());
        expect(expectedNewMetaData, await newDb.select(newDb.meta).get());
      },
    );
  });
}
