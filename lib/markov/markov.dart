import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:huldra/markov/word.dart';

part 'markov.g.dart';

@HiveType(typeId: 1)
class Markov extends HiveObject {
  /// Count of messages trained off of
  @HiveField(0)
  int msgCount = 0;

  /// Count of unique words known
  @HiveField(1)
  int wordCount = 0;

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
  double _tfidf(Word term, int msgLength, int termCount) {
    return (termCount / msgLength) * log(msgCount / term.msgOccurances) / ln10;
  }

  /// Train off of a sample array
  ///
  /// Trains the markov chain off of [tokens], converting them into [Word] objects
  void train(List<String> tokens) async {
    var kb = Hive.box<Word>('kb');

    msgCount++;

    var dupeCheck = <String, bool>{};

    for (var i = 0; i < tokens.length; i++) {
      var key = sha1.convert(utf8.encode(tokens[i])).toString();
      var word = kb.get(key);

      if (word == null) {
        wordCount++;
        word = Word(tokens[i]);
        await kb.put(key, word);
      }

      word.distFromHead.update(i, (value) => value + 1, ifAbsent: () => 1);
      word.distFromTail.update((tokens.length - 1) - i, (value) => value + 1,
          ifAbsent: () => 1);
      word.totalOccurances++;

      dupeCheck.update(key, (value) => true, ifAbsent: () {
        word.msgOccurances++;
        return true;
      });

      if (i != 0) {
        var prefixKey = sha1.convert(utf8.encode(tokens[i - 1])).toString();
        word.prefixes
            .update(prefixKey, (value) => value + 1, ifAbsent: () => 1);
      }

      if (i != tokens.length - 1) {
        var suffixKey = sha1.convert(utf8.encode(tokens[i + 1])).toString();
        word.suffixes
            .update(suffixKey, (value) => value + 1, ifAbsent: () => 1);
      }
    }
  }

  String generate(List<String> tokens) {
    var kb = Hive.box<Word>('kb');
    var rand = Random(DateTime.now().millisecondsSinceEpoch);

    Word anchor;

    if (tokens.isNotEmpty) {
      var words = <double, Word>{};

      tokens.forEach((token) {
        var word = kb.get(sha1.convert(utf8.encode(token)).toString());
        words[_tfidf(word, tokens.length,
            tokens.where((t) => t == word.word).length)] = word;
      });

      var sumOfWeights = words.keys.fold<double>(0, (p, e) => p + e);

      var r = rand.nextDouble() * sumOfWeights;

      for (var key in words.keys) {
        r -= key;

        if (r <= 0) {
          anchor = words[key];
          break;
        }
      }
    } else {
      // TODO: get a random word in the event that we don't have any tokens
      anchor = kb.get(sha1.convert(utf8.encode('mariodude')).toString());
    }

    var prefixWords = <Word>[];
    var prefixCount = anchor.randomDistFromHead(rand.nextDouble());

    if (prefixCount > 0) {
      prefixWords.add(anchor.randomPrefix(rand.nextDouble()));
      prefixCount--;
    }

    while (prefixCount > 0) {
      if (prefixWords.first.prefixes.isNotEmpty) {
        var prefix = prefixWords.first.randomPrefix(rand.nextDouble());
        prefixWords.insert(0, prefix);
      } else {
        prefixCount = 0;
        break;
      }

      prefixCount--;
    }

    var suffixWords = <Word>[];
    var suffixCount = anchor.randomDistFromTail(rand.nextDouble());

    if (suffixCount > 0) {
      suffixWords.add(anchor.randomSuffix(rand.nextDouble()));
      suffixCount--;

      while (suffixWords.last.suffixes.isNotEmpty) {
        // if (suffixCount > 0) {
        suffixCount--;
        // }

        var suffix = suffixWords.last.randomSuffix(rand.nextDouble());
        suffixWords.add(suffix);

        if (suffixCount <= -5 && suffix.distFromTail.containsKey(0)) {
          break;
        }
      }
    }

    // while (suffixCount > 0) {
    //   if (suffixWords.last.suffixes.isNotEmpty) {
    //     var suffix = suffixWords.last.randomSuffix(rand.nextDouble());
    //     suffixWords.add(suffix);
    //   } else {
    //     suffixCount = 0;
    //     break;
    //   }
    // }

    return '${prefixWords.map((w) => w.word).toList().join(' ')} ${anchor.word} ${suffixWords.map((w) => w.word).toList().join(' ')}';
  }
}
