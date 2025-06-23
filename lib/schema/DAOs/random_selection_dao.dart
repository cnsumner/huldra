import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fasttext/fasttext.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:injector/injector.dart';

part 'random_selection_dao.g.dart';

@DriftAccessor(tables: [Prefixes, Suffixes, HeadDistances, TailDistances])
class RandomSelectionDao extends DatabaseAccessor<KnowledgeBase> with _$RandomSelectionDaoMixin {
  RandomSelectionDao(super.db);

  Future<int> _randomWeightedDist(
    List<({int dist, int weight})> distances,
    double randomValue,
  ) async {
    if (distances.isNotEmpty) {
      final sumOfWeights = distances.fold<num>(0, (prev, element) => prev + log(element.weight));

      var weightedRandom = randomValue * sumOfWeights;

      for (final entry in distances) {
        weightedRandom -= log(entry.weight);

        if (weightedRandom <= 0) {
          return entry.dist;
        }
      }
    }

    return 0;
  }

  /// Get weighted random dist from head
  Future<int> randomWeightedDistFromHead(String wordHash, double randomValue) async {
    return _randomWeightedDist(await attachedDatabase.getHeadDistances(wordHash), randomValue);
  }

  /// Get weighted random dist from tail
  Future<int> randomWeightedDistFromTail(String wordHash, double randomValue) async {
    return _randomWeightedDist(await attachedDatabase.getTailDistances(wordHash), randomValue);
  }

  Future<Word?> _weightedRandomWordSelection(
    List<({Word word, int weight})> wordWeights,
    double randomValue,
  ) async {
    if (wordWeights.isNotEmpty) {
      final sumOfWeights = wordWeights.fold<int>(0, (prev, element) => prev + element.weight);

      var weightedRandom = randomValue * sumOfWeights;

      for (final entry in wordWeights) {
        weightedRandom -= entry.weight;

        if (weightedRandom <= 0) {
          return entry.word;
        }
      }
    }

    return null;
  }

  /// Get weighted random prefix
  ///
  /// Returns null if no prefixes are available
  Future<Word?> weightedRandomPrefix(
    String wordHash,
    double randomValue,
  ) async {
    final prefixWeights = await attachedDatabase.managers.prefixes
        .withReferences((prefetch) => prefetch(prefixHash: true))
        .filter((p) => p.wordHash.wordHash(wordHash))
        .map<({Word word, int weight})>(
          (p) => (word: p.$2.prefixHash.prefetchedData!.single, weight: p.$1.count),
        )
        .get();

    return _weightedRandomWordSelection(prefixWeights, randomValue);
  }

  /// Get weighted random suffix
  ///
  /// Returns null if no suffixes are available
  Future<Word?> weightedRandomSuffix(
    String wordHash,
    double randomValue,
  ) async {
    final suffixWeights = await attachedDatabase.managers.suffixes
        .withReferences((prefetch) => prefetch(suffixHash: true))
        .filter((s) => s.wordHash.wordHash(wordHash))
        .map<({Word word, int weight})>(
          (s) => (word: s.$2.suffixHash.prefetchedData!.single, weight: s.$1.count),
        )
        .get();

    return _weightedRandomWordSelection(suffixWeights, randomValue);
  }

  /// Get weighted random prefix with semantic context
  Future<Word?> _semanticContextWordSelection(
    double randomValue,
    List<Word> words,
    List<double> context,
  ) async {
    if (words.isNotEmpty) {
      final fasttext = Injector.appInstance.get<FastText>();

      if (words.length == 1) {
        // If there's only one word, we can return it directly
        return words.first;
      }

      final wordWeights = Map.fromEntries(
        words.map((word) {
          final embedding = fasttext.getWordVector(word.word);
          final similarity = cosineSimilarity(context, embedding);
          return MapEntry(word, similarity);
        }),
      );

      final sumOfWeights = wordWeights.values.fold<double>(0, (prev, element) => prev + element);

      var weightedRandom = randomValue * sumOfWeights;

      for (final word in wordWeights.entries) {
        weightedRandom -= word.value;

        if (weightedRandom <= 0) {
          return word.key;
        }
      }
    }

    return null;
  }

  Future<Word?> randomPrefixWithContext(
    String wordHash,
    double randomValue,
    List<double> context,
  ) async {
    final prefixes = await attachedDatabase.managers.prefixes
        .withReferences((prefetch) => prefetch(prefixHash: true))
        .filter((p) => p.wordHash.wordHash(wordHash))
        .map<Word>(
          (p) => p.$2.prefixHash.prefetchedData!.single,
        )
        .get();

    return _semanticContextWordSelection(randomValue, prefixes, context);
  }

  Future<Word?> randomSuffixWithContext(
    String wordHash,
    double randomValue,
    List<double> context,
  ) async {
    final suffixes = await attachedDatabase.managers.suffixes
        .withReferences((prefetch) => prefetch(suffixHash: true))
        .filter((s) => s.wordHash.wordHash(wordHash))
        .map<Word>(
          (s) => s.$2.suffixHash.prefetchedData!.single,
        )
        .get();

    return _semanticContextWordSelection(randomValue, suffixes, context);
  }
}
