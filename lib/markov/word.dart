class Word {
  /// Full length word
  String word;

  /// Words seen before this word and their occurance counts
  ///
  /// {wordHash, count}
  Map<String, int> prefixes;

  /// Words seen after this word and their occurance counts
  ///
  /// {wordHash, count}
  Map<String, int> suffixes;

  /// Positions from beginning of message this word is typically found at
  ///
  /// {pos, count}
  Map<int, int> distFromHead;

  /// Positions from end of message this word is typically found at
  ///
  /// {pos, count}
  Map<int, int> distFromTail;

  /// Number of times this word occurs across all messages
  int totalOccurances;

  /// Number of messages this word occurs in
  int msgOccurances;

  Word(this.word);
}
