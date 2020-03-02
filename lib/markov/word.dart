import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends HiveObject {
  /// Full length word
  @HiveField(0)
  String word;

  /// Words seen before this word and their occurance counts
  ///
  /// {wordHash, count}
  @HiveField(1)
  Map<String, int> prefixes = {};

  /// Words seen after this word and their occurance counts
  ///
  /// {wordHash, count}
  @HiveField(2)
  Map<String, int> suffixes = {};

  /// Positions from beginning of message this word is typically found at
  ///
  /// {pos, count}
  @HiveField(3)
  Map<int, int> distFromHead = {};

  /// Positions from end of message this word is typically found at
  ///
  /// {pos, count}
  @HiveField(4)
  Map<int, int> distFromTail = {};

  /// Number of times this word occurs across all messages
  @HiveField(5)
  int totalOccurances = 0;

  /// Number of messages this word occurs in
  @HiveField(6)
  int msgOccurances = 0;

  Word(this.word);

  @override
  String toString() {
    var kb = Hive.box<Word>('kb');

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
Top prefix: ${topPrefixes.isNotEmpty ? kb.get(topPrefixes.first)?.word : ''}
Top Suffix: ${topSuffixes.isNotEmpty ? kb.get(topSuffixes.first)?.word : ''}
```''';
  }
}
