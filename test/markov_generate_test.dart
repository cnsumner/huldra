// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:drift/native.dart';
import 'package:fasttext/fasttext.dart';
import 'package:huldra/markov/markov.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/yaml_config.dart';
import 'package:injector/injector.dart';
import 'package:test/test.dart';

void main() {
  group('Markov.generate', () {
    late KnowledgeBase db;
    setUpAll(() async {
      // Setup in-memory database for testing
      db = KnowledgeBase(NativeDatabase.memory());
      Injector.appInstance.registerSingleton<KnowledgeBase>(() => db);

      // Insert minimal metadata row if not present
      await db.updateMetadata(const MetaData(id: 1, msgCount: 1, wordCount: 2));

      // Insert some words into the database
      final hashHello = sha1.convert(utf8.encode('hello')).toString();
      final hashWorld = sha1.convert(utf8.encode('world')).toString();
      await db.updateWords([
        Word(
          wordHash: hashHello,
          word: 'hello',
          prefixes: {},
          suffixes: {hashWorld: 1},
          distFromHead: {0: 1},
          distFromTail: {1: 1},
          totalOccurances: 1,
          msgOccurances: 1,
        ),
        Word(
          wordHash: hashWorld,
          word: 'world',
          prefixes: {hashHello: 1},
          suffixes: {},
          distFromHead: {1: 1},
          distFromTail: {0: 1},
          totalOccurances: 1,
          msgOccurances: 1,
        ),
      ]);
    });

    tearDownAll(() async {
      await db.close();
      Injector.appInstance.clearAll();
    });

    setUp(() {
      // Reset YamlConfig and FastText before each test
      Injector.appInstance.clearAll();
      Injector.appInstance.registerSingleton<KnowledgeBase>(() => db);
    });

    test('generates a sentence from tokens (no fastText)', () async {
      final tokens = ['hello', 'world'];
      final config = YamlConfig('useFastText: false');
      Injector.appInstance.registerSingleton<YamlConfig>(() => config);
      String sentence;
      try {
        sentence = await Markov.generate(tokens);
      } catch (e, st) {
        fail('Markov.generate threw an exception: \n$e\n$st');
      }
      expect(sentence, isA<String>());
      expect(sentence.trim().isNotEmpty, isTrue);
      print('Generated sentence: $sentence');
    });

    test('generates a sentence using fastText', () async {
      final config = YamlConfig('useFastText: true');
      Injector.appInstance.registerSingleton<YamlConfig>(() => config, override: true);
      Injector.appInstance.registerSingleton<FastText>(() {
        final fasttext = FastText(libraryPath: 'build/libfasttext.dylib');
        fasttext.loadModel('build/fasttext.bin');
        return fasttext;
      });
      final tokens = ['hello', 'world'];
      String sentence;
      try {
        sentence = await Markov.generate(tokens);
      } catch (e, st) {
        fail('Markov.generate (fastText) threw an exception: \n$e\n$st');
      }
      expect(sentence, isA<String>());
      expect(sentence.trim().isNotEmpty, isTrue);
      print('Generated sentence with fastText: $sentence');
    });
  });

  group('Markov.generate (real KB)', () {
    late KnowledgeBase realDb;
    setUpAll(() {
      // Use the real kb.sqlite file
      realDb = KnowledgeBase(NativeDatabase(File('build/kb.sqlite')));
      Injector.appInstance.clearAll();
      Injector.appInstance.registerSingleton<KnowledgeBase>(() => realDb);
    });

    tearDownAll(() async {
      await realDb.close();
      Injector.appInstance.clearAll();
    });

    setUp(() {
      // Only re-register the existing realDb instance, do not create a new one
      Injector.appInstance.clearAll();
      Injector.appInstance.registerSingleton<KnowledgeBase>(() => realDb);
    });

    test('generates a sentence from tokens (no fastText, real KB)', () async {
      final tokens = ['hello', 'world'];
      final config = YamlConfig('useFastText: false');
      Injector.appInstance.registerSingleton<YamlConfig>(() => config);
      String sentence;
      try {
        sentence = await Markov.generate(tokens);
      } catch (e, st) {
        fail('Markov.generate (real KB) threw an exception: \n$e\n$st');
      }
      expect(sentence, isA<String>());
      expect(sentence.trim().isNotEmpty, isTrue);
      print('Generated sentence (real KB): $sentence');
    });

    test('generates a sentence using fastText (real KB)', () async {
      final config = YamlConfig('useFastText: true');
      Injector.appInstance.registerSingleton<YamlConfig>(() => config, override: true);
      Injector.appInstance.registerSingleton<FastText>(() {
        final fasttext = FastText(libraryPath: 'build/libfasttext.dylib');
        fasttext.loadModel('build/fasttext.bin');
        return fasttext;
      });
      // tokens for: "this is a test sentence for testing"
      final tokens = ['this', 'is', 'a', 'test', 'sentence', 'for', 'testing'];
      String sentence;
      try {
        sentence = await Markov.generate(tokens);
      } catch (e, st) {
        fail('Markov.generate (fastText, real KB) threw an exception: \n$e\n$st');
      }
      expect(sentence, isA<String>());
      expect(sentence.trim().isNotEmpty, isTrue);
      print('Generated sentence with fastText (real KB): $sentence');
    });
  });
}
