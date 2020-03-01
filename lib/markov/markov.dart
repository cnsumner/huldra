import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:huldra/markov/word.dart';

class Markov extends HiveObject {
  /// Count of messages trained off of
  int msgCount = 0;

  /// Count of unique words known
  int wordCount = 0;

  /// Computes the tf-idf of the given word
  ///
  /// Simply put, this calculates an importance metric of the given word using:
  /// * [termCount]: Count of [term] occurances in the current message
  /// * [msgLength]: Length (in words/terms) of the current message
  /// * [msgCount]: Number of messages trained off of
  /// * [msgOccurances]: number of messages this term appears in
  ///
  /// See details of tf-idf [here](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)
  double _tfidf(Word term, int msgLength, int termCount) {
    return (termCount / msgLength) * log(msgCount / term.msgOccurances) / ln10;
  }

  /// Train off of a sample array
  ///
  /// Trains the markov chain off of [words], converting them into [Word] objects
  void train(List<String> words) {
    var kb = Hive.box('kb');

    for (var i = 0; i < words.length; i++) {
      var key = sha1.convert(utf8.encode(words[i]));
      var word = kb.get(key, defaultValue: Word(words[i]));
    }
  }
}
