// ignore_for_file: avoid_print

import 'dart:io';

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

      await Markov.train([
        [
          'this',
          'is',
          'a',
          'test',
          'sentence',
          'for',
          'testing',
        ],
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

      final config = YamlConfig(
        'discordToken: notreal\nownerId: 0\nprobability: 1\nuseFastText: false',
      );
      Injector.appInstance.registerSingleton<YamlConfig>(() => config);
    });

    test('generates a sentence from tokens (no fastText)', () async {
      final tokens = ['hello', 'test'];
      await Markov.train([tokens]);

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
      final config = Injector.appInstance.get<YamlConfig>();
      config.useFastText = true;

      Injector.appInstance.registerSingleton<FastText>(() {
        final fasttext = FastText(libraryPath: 'build/libfasttext.dylib');
        fasttext.loadModel('build/fasttext.bin');
        return fasttext;
      });
      final tokens = ['hello', 'world'];
      await Markov.train([tokens]);

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

      final config = YamlConfig(
        'discordToken: notreal\nownerId: 0\nprobability: 1\nuseFastText: false',
      );
      Injector.appInstance.registerSingleton<YamlConfig>(() => config);
    });

    test('generates a sentence from tokens (no fastText, real KB)', () async {
      final tokens = ['hello', 'world'];

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
      final config = Injector.appInstance.get<YamlConfig>();
      config.useFastText = true;

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
