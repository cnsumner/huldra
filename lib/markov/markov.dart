// ignore_for_file: avoid_classes_with_only_static_members, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:fasttext/fasttext.dart';
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
  static Future<void> train(
    List<String> tokens,
  ) async {
    if (tokens.isEmpty) {
      return;
    }

    final kb = Injector.appInstance.get<KnowledgeBase>();

    final dupeCheck = <String, bool>{};

    final keys = tokens.map((token) => sha1.convert(utf8.encode(token)).toString());

    var newWordCount = 0;

    final prefixes = <PrefixesCompanion>[];
    final suffixes = <SuffixesCompanion>[];
    final headDistances = <HeadDistancesCompanion>[];
    final tailDistances = <TailDistancesCompanion>[];

    for (var i = 0; i < tokens.length; i++) {
      final key = keys.elementAt(i);

      final word = await kb.upsertWord(
        key,
        tokens[i],
        updateMsgCount: !dupeCheck.containsKey(key),
      );

      if (word.msgOccurances == 1 && word.totalOccurances == 1) {
        newWordCount++;
      }

      headDistances.add(HeadDistancesCompanion.insert(wordHash: key, distance: i, count: 1));
      tailDistances.add(
        TailDistancesCompanion.insert(wordHash: key, distance: (tokens.length - 1) - i, count: 1),
      );

      dupeCheck.putIfAbsent(key, () => true);

      if (i != 0) {
        final prefixKey = sha1.convert(utf8.encode(tokens[i - 1])).toString();
        prefixes.add(PrefixesCompanion.insert(wordHash: key, prefixHash: prefixKey, count: 1));
      }

      if (i != tokens.length - 1) {
        final suffixKey = sha1.convert(utf8.encode(tokens[i + 1])).toString();
        suffixes.add(SuffixesCompanion.insert(wordHash: key, suffixHash: suffixKey, count: 1));
      }
    }

    await kb.batch((batch) async {
      kb.upsertHeadDists(headDistances, batch);
      kb.upsertTailDists(tailDistances, batch);
      kb.upsertPrefixes(prefixes, batch);
      kb.upsertSuffixes(suffixes, batch);
    });

    await kb.updateMetadata(msgCount: 1, wordCount: newWordCount);
  }

  static Future<String> generate(List<String> tokens) async {
    final kb = Injector.appInstance.get<KnowledgeBase>();
    final useFastText = Injector.appInstance.get<YamlConfig>().getBool('useFastText');
    final rand = Random(DateTime.now().millisecondsSinceEpoch);

    final metadata = await kb.getMetadata();

    Word? anchor;

    List<double>? sentenceVector;

    if (tokens.isNotEmpty) {
      sentenceVector = useFastText
          ? Injector.appInstance.get<FastText>().getSentenceVector(tokens.join(' '))
          : null;

      final wordWeightMap = <double, Word>{};

      for (final word in (await kb.getWords(
        tokens.map((token) => sha1.convert(utf8.encode(token)).toString()).toList(),
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

        wordWeightMap[tfidf * (useFastText ? similarity : 1.0)] = word;
      }

      final sumOfWeights = wordWeightMap.keys.fold<double>(0, (p, e) => p + e);

      var r = rand.nextDouble() * sumOfWeights;

      for (final entry in wordWeightMap.entries) {
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
    final prefixCount = await kb.randomSelectionDao.randomWeightedDistFromHead(
      anchor.wordHash,
      rand.nextDouble(),
    );

    if (prefixCount > 0) {
      prefixWords.add(
        useFastText
            ? (await kb.randomSelectionDao.randomPrefixWithContext(
                anchor.wordHash,
                rand.nextDouble(),
                sentenceVector!,
              ))!
            : (await kb.randomSelectionDao.weightedRandomPrefix(
                anchor.wordHash,
                rand.nextDouble(),
              ))!,
      ); // using null-check here since, if [prefixCount] > 0 then [randomPrefix] can't return null

      while (true) {
        final prefix = (useFastText
            ? await kb.randomSelectionDao.randomPrefixWithContext(
                prefixWords.first.wordHash,
                rand.nextDouble(),
                sentenceVector!,
              )
            : await kb.randomSelectionDao.weightedRandomPrefix(
                prefixWords.first.wordHash,
                rand.nextDouble(),
              ));

        if (prefix == null) {
          break; // no more prefixes available
        }

        prefixWords.insert(
          0,
          prefix,
        );

        if (prefixWords.length >= prefixCount) {
          final headDistances = await kb.getHeadDistances(prefix.wordHash, order: OrderingMode.asc);

          if (headDistances.first.dist == 0) {
            break;
          } else if (prefixWords.length / prefixCount > 1.5) {
            // find the first prefix in the list that has a distance of 0, using an async loop
            var lastHeadIndex = prefixWords.length;
            for (int i = 0; i < prefixWords.length; i++) {
              final prefix = prefixWords[i];
              final headDistances = await kb.getHeadDistances(
                prefix.wordHash,
                order: OrderingMode.asc,
              );
              if (headDistances.first.dist == 0) {
                lastHeadIndex = i;
                break;
              }
            }

            prefixWords.removeRange(0, lastHeadIndex);

            break;
          }
        }
      }
    }

    final suffixWords = <Word>[];
    final suffixCount = await kb.randomSelectionDao.randomWeightedDistFromTail(
      anchor.wordHash,
      rand.nextDouble(),
    );

    if (suffixCount > 0) {
      suffixWords.add(
        useFastText
            ? (await kb.randomSelectionDao.randomSuffixWithContext(
                anchor.wordHash,
                rand.nextDouble(),
                sentenceVector!,
              ))!
            : (await kb.randomSelectionDao.weightedRandomSuffix(
                anchor.wordHash,
                rand.nextDouble(),
              ))!,
      );

      while (true) {
        final suffix = (useFastText
            ? await kb.randomSelectionDao.randomSuffixWithContext(
                suffixWords.last.wordHash,
                rand.nextDouble(),
                sentenceVector!,
              )
            : await kb.randomSelectionDao.weightedRandomSuffix(
                suffixWords.last.wordHash,
                rand.nextDouble(),
              ));

        if (suffix == null) {
          break; // no more suffixes available
        }

        suffixWords.add(suffix);

        if (suffixWords.length >= suffixCount) {
          final tailDistances = await kb.getTailDistances(suffix.wordHash, order: OrderingMode.asc);
          if (tailDistances.first.dist == 0) {
            break;
          } else if (suffixWords.length / suffixCount > 1.5) {
            var lastTailIndex = suffixWords.length - 1;
            // work backwards to find the last suffix that has a distance of 0
            for (final suffix in suffixWords.reversed) {
              final tailDistances = await kb.getTailDistances(
                suffix.wordHash,
                order: OrderingMode.asc,
              );
              // if this is a tail distance of 0 (appropriate end of sentence), then we can stop
              if (tailDistances.first.dist == 0) {
                break;
              }
              lastTailIndex--;
            }

            // remove from end of list after the last tail found
            suffixWords.removeRange(
              lastTailIndex + 1,
              suffixWords.length,
            );

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
