import 'dart:math';

import 'package:huldra/schema/knowledge_base.dart';
import 'package:injector/injector.dart';

extension WordExtensions on Word {
  /// Creates a new word with [wordHash] and [word] with all other fields defaulted
  static Word constructWord(String wordHash, String word) {
    return Word(
        wordHash: wordHash,
        word: word,
        prefixes: <String, int>{},
        suffixes: <String, int>{},
        distFromHead: <int, int>{},
        distFromTail: <int, int>{},
        totalOccurances: 0,
        msgOccurances: 0);
  }

  /// Performs a weighted random selection on [map] using [r] as the random value
  Future<Word> _weightedRandomWordSelection(
      double r, Map<String, int> map) async {
    if (map.isNotEmpty) {
      var kb = Injector.appInstance.getDependency<KnowledgeBase>();
      var sumOfWeights = map.values.fold(0, (prev, element) => prev + element);

      r = r * sumOfWeights;

      for (var key in map.keys) {
        r -= map[key];

        if (r <= 0) {
          return kb.getWord(key);
        }
      }
    }

    return null;
  }

  /// Performs a weighted random selection on [map] using [r] as the random value
  int _weightedRandomDistSelection(double r, Map<int, int> map) {
    if (map.isNotEmpty) {
      var sumOfWeights =
          map.values.fold(0, (prev, element) => prev + log(element));

      r = r * sumOfWeights;

      for (var key in map.keys) {
        r -= log(map[key]);

        if (r <= 0) {
          return key;
        }
      }
    }

    return 0;
  }

  /// Performs a weighted random selection on [prefixes] using [r] as the random value
  Future<Word> randomPrefix(double r) async {
    return _weightedRandomWordSelection(r, prefixes);
  }

  /// Performs a weighted random selection on [suffixes] using [r] as the random value
  Future<Word> randomSuffix(double r) async {
    return _weightedRandomWordSelection(r, suffixes);
  }

  /// Performs a weighted random selection on [distFromHead] using [r] as the random value
  int randomDistFromHead(double r) {
    return _weightedRandomDistSelection(r, distFromHead);
  }

  /// Performs a weighted random selection on [distFromTail] using [r] as the random value
  int randomDistFromTail(double r) {
    return _weightedRandomDistSelection(r, distFromTail);
  }

  Future<String> toFormattedString() async {
    var kb = Injector.appInstance.getDependency<KnowledgeBase>();

    var topPrefixes = prefixes.keys.toList();
    topPrefixes.sort((a, b) {
      return prefixes[b].compareTo(prefixes[a]);
    });

    var topSuffixes = suffixes.keys.toList();
    topSuffixes.sort((a, b) {
      return suffixes[b].compareTo(suffixes[a]);
    });

    return '''```
Word: $word
Total usages: $totalOccurances
Messages used in: $msgOccurances
Top prefix: ${topPrefixes.isNotEmpty ? (await kb.getWord(topPrefixes.first))?.word : ''}
Top Suffix: ${topSuffixes.isNotEmpty ? (await kb.getWord(topSuffixes.first))?.word : ''}
```''';
  }
}
