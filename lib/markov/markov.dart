// ignore_for_file: avoid_classes_with_only_static_members, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:fasttext/fasttext.dart';
import 'package:huldra/extensions/word_extensions.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/yaml_config.dart';
import 'package:injector/injector.dart';

class Markov {
  /// Computes the tf-idf of the given word
  ///
  /// Simply put, this calculates an importance metric of the given word using:
  ///
  /// - [termCount] -> Count of [term] occurances in the current message
  /// - [msgLength] -> Length (in words/terms) of the current message
  /// - [msgCount] -> Number of messages trained off of
  /// - [msgOccurances] -> number of messages this term appears in
  ///
  /// See details of tf-idf [here](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)
  static double _tfidf(MetaData metadata, Word term, int msgLength, int termCount) {
    return (termCount / msgLength) * log(metadata.msgCount / term.msgOccurances) / ln10;
  }

  /// Train off of a sample array
  ///
  /// Trains the markov chain off of [tokens], converting them into [Word] objects
  static Future<MetaData> train(
    MetaData metadata,
    Map<String, Word> wordMap,
    List<String> tokens,
  ) async {
    final kb = Injector.appInstance.get<KnowledgeBase>();

    final msgCount = metadata.msgCount + 1;
    var wordCount = metadata.wordCount;

    final dupeCheck = <String, bool>{};

    final keys = tokens.map((token) => sha1.convert(utf8.encode(token)).toString());

    final words = await kb.getWords(keys.where((key) => !wordMap.containsKey(key)).toList());

    for (final word in words) {
      wordMap.putIfAbsent(word.wordHash, () => word);
    }

    for (var i = 0; i < tokens.length; i++) {
      final key = keys.elementAt(i);

      Word word;

      word =
          wordMap[key] ??
          () {
            wordCount++;
            return WordExtensions.constructWord(key, tokens[i]);
          }();

      var totalOccurances = word.totalOccurances;
      var msgOccurances = word.msgOccurances;

      word.distFromHead.update(i, (value) => value + 1, ifAbsent: () => 1);
      word.distFromTail.update((tokens.length - 1) - i, (value) => value + 1, ifAbsent: () => 1);

      totalOccurances++;

      dupeCheck.update(
        key,
        (value) => true,
        ifAbsent: () {
          msgOccurances++;
          return true;
        },
      );

      if (i != 0) {
        final prefixKey = sha1.convert(utf8.encode(tokens[i - 1])).toString();
        word.prefixes.update(prefixKey, (value) => value + 1, ifAbsent: () => 1);
      }

      if (i != tokens.length - 1) {
        final suffixKey = sha1.convert(utf8.encode(tokens[i + 1])).toString();
        word.suffixes.update(suffixKey, (value) => value + 1, ifAbsent: () => 1);
      }

      wordMap[key] = word.copyWith(totalOccurances: totalOccurances, msgOccurances: msgOccurances);

      // await kb.updateWord(word.copyWith(
      //     totalOccurances: _totalOccurances, msgOccurances: _msgOccurances));
    }

    // await kb.updateWords(wordMap.entries
    //     .where((element) => element.key != null)
    //     .map<Word>((entry) => entry.value)
    //     .toList(growable: false));

    // await kb.updateMetadata(
    //     metadata.copyWith(msgCount: _msgCount, wordCount: _wordCount));

    return metadata.copyWith(msgCount: msgCount, wordCount: wordCount);
  }

  static Future<String> generate(List<String> tokens) async {
    final kb = Injector.appInstance.get<KnowledgeBase>();
    final useFastText = Injector.appInstance.get<YamlConfig>().getBool('useFastText');
    final rand = Random(DateTime.now().millisecondsSinceEpoch);

    final metadata = await kb.getMetadata();

    Word? anchor;

    var sentenceVector = useFastText
        ? Injector.appInstance.get<FastText>().getSentenceVector(tokens.join(' '))
        : null;

    if (tokens.isNotEmpty) {
      final words = <double, Word>{};

      for (final word in (await Future.wait<Word>(
        tokens.map<Future<Word>>(
          (token) => kb.getWord(sha1.convert(utf8.encode(token)).toString()),
        ),
      ))) {
        final tfidf = _tfidf(
          metadata,
          word,
          tokens.length,
          tokens.where((t) => t == word.word).length,
        );
        var similarity = 0.0;

        if (useFastText) {
          final wordVector = Injector.appInstance.get<FastText>().getWordVector(word.word);
          // calculate similarity between sentence vector and word vector
          similarity = cosineSimilarity(sentenceVector!, wordVector);
        }

        words[tfidf * (useFastText ? similarity : 1.0)] = word;
      }

      final sumOfWeights = words.keys.fold<double>(0, (p, e) => p + e);

      var r = rand.nextDouble() * sumOfWeights;

      for (final entry in words.entries) {
        r -= entry.key;

        if (r <= 0) {
          anchor = entry.value;
          break;
        }
      }
    }

    if (anchor == null) {
      anchor = await kb.randomWord().getSingle();
      sentenceVector = useFastText
          ? Injector.appInstance.get<FastText>().getWordVector(anchor.word)
          : null;
    }

    final prefixWords = <Word>[];
    final prefixCount = anchor.randomDistFromHead(rand.nextDouble());

    if (prefixCount > 0) {
      prefixWords.add(
        (useFastText
            ? await anchor.randomPrefixWithContext(rand.nextDouble(), sentenceVector!)
            : await anchor.randomPrefix(rand.nextDouble()))!,
      ); // using null-check here since, if [prefixCount] > 0 then [randomPrefix] can't return null

      while (prefixWords.first.prefixes.isNotEmpty) {
        final prefix = (useFastText
            ? await prefixWords.first.randomPrefixWithContext(
                rand.nextDouble(),
                sentenceVector!,
              )
            : await prefixWords.first.randomPrefix(rand.nextDouble()));
        prefixWords.insert(
          0,
          prefix!,
        ); // null-check used here here because of the while condition above

        if (prefixWords.length >= prefixCount) {
          if (prefix.distFromHead.containsKey(0)) {
            break;
          } else if (prefixWords.length / prefixCount > 1.5) {
            final lastHeadIndex = prefixWords
                .takeWhile((word) => !word.distFromHead.containsKey(0))
                .length;

            if (lastHeadIndex < prefixWords.length) {
              prefixWords.removeRange(0, lastHeadIndex);
            }

            break;
          }
        }
      }
    }

    final suffixWords = <Word>[];
    final suffixCount = anchor.randomDistFromTail(rand.nextDouble());

    if (suffixCount > 0) {
      suffixWords.add(
        (useFastText
            ? await anchor.randomSuffixWithContext(rand.nextDouble(), sentenceVector!)
            : await anchor.randomSuffix(rand.nextDouble()))!,
      ); // null-check same as above

      while (suffixWords.last.suffixes.isNotEmpty) {
        final suffix = (useFastText
            ? await suffixWords.last.randomSuffixWithContext(rand.nextDouble(), sentenceVector!)
            : await suffixWords.last.randomSuffix(rand.nextDouble()));
        suffixWords.add(suffix!); // null-check same as above

        if (suffixWords.length >= suffixCount) {
          if (suffix.distFromTail.containsKey(0)) {
            break;
          } else if (suffixWords.length / suffixCount > 1.5) {
            final lastTailIndex = suffixWords.reversed
                .takeWhile((word) => !word.distFromTail.containsKey(0))
                .length;

            if (lastTailIndex < suffixWords.length) {
              suffixWords.removeRange(lastTailIndex + 1, suffixWords.length);
            }

            break;
          }
        }
      }
    }

    print('Attempting to generate $prefixCount prefixes and $suffixCount suffixes...');
    print('Generated ${prefixWords.length} prefixes and ${suffixWords.length} suffixes.');

    return '${prefixWords.map((w) => w.word).toList().join(' ')} ${anchor.word} ${suffixWords.map((w) => w.word).toList().join(' ')}';
  }
}
