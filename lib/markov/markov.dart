import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:huldra/extensions/word_extensions.dart';
import 'package:huldra/schema/knowledge_base.dart';
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
  static double _tfidf(
      MetaData metadata, Word term, int msgLength, int termCount) {
    return (termCount / msgLength) *
        log(metadata.msgCount / term.msgOccurances) /
        ln10;
  }

  /// Train off of a sample array
  ///
  /// Trains the markov chain off of [tokens], converting them into [Word] objects
  static Future<MetaData> train(
      MetaData metadata, Map<String, Word> wordMap, List<String> tokens) async {
    var kb = Injector.appInstance.getDependency<KnowledgeBase>();

    var _msgCount = metadata.msgCount + 1;
    var _wordCount = metadata.wordCount;

    var dupeCheck = <String, bool>{};

    var keys =
        tokens.map((token) => sha1.convert(utf8.encode(token)).toString());

    var words = (await kb
        .getWords(keys.where((key) => !wordMap.containsKey(key)).toList()));

    words.forEach((word) {
      wordMap.putIfAbsent(word.wordHash, () => word);
    });

    for (var i = 0; i < tokens.length; i++) {
      var key = keys.elementAt(i);

      Word word;

      if (wordMap.containsKey(key)) {
        word = wordMap[key];
      } else {
        _wordCount++;
        word = WordExtensions.constructWord(key, tokens[i]);
      }

      var _totalOccurances = word.totalOccurances;
      var _msgOccurances = word.msgOccurances;

      word.distFromHead.update(i, (value) => value + 1, ifAbsent: () => 1);
      word.distFromTail.update((tokens.length - 1) - i, (value) => value + 1,
          ifAbsent: () => 1);

      _totalOccurances++;

      dupeCheck.update(key, (value) => true, ifAbsent: () {
        _msgOccurances++;
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

      wordMap[key] = word.copyWith(
          totalOccurances: _totalOccurances, msgOccurances: _msgOccurances);

      // await kb.updateWord(word.copyWith(
      //     totalOccurances: _totalOccurances, msgOccurances: _msgOccurances));
    }

    // await kb.updateWords(wordMap.entries
    //     .where((element) => element.key != null)
    //     .map<Word>((entry) => entry.value)
    //     .toList(growable: false));

    // await kb.updateMetadata(
    //     metadata.copyWith(msgCount: _msgCount, wordCount: _wordCount));

    return metadata.copyWith(msgCount: _msgCount, wordCount: _wordCount);
  }

  static Future<String> generate(List<String> tokens) async {
    var kb = Injector.appInstance.getDependency<KnowledgeBase>();
    var rand = Random(DateTime.now().millisecondsSinceEpoch);

    var metadata = await kb.getMetadata();

    Word anchor;

    if (tokens.isNotEmpty) {
      var words = <double, Word>{};

      (await Future.wait<Word>(tokens.map<Future<Word>>((token) =>
              kb.getWord(sha1.convert(utf8.encode(token)).toString()))))
          .forEach((word) {
        words[_tfidf(metadata, word, tokens.length,
            tokens.where((t) => t == word.word).length)] = word;
      });

      // tokens.forEach((token) async {
      //   var word =
      //       await kb.getWord(sha1.convert(utf8.encode(token)).toString());
      // });

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
      anchor = await kb.randomWord().getSingle();
    }

    var prefixWords = <Word>[];
    var prefixCount = anchor.randomDistFromHead(rand.nextDouble());

    if (prefixCount > 0) {
      prefixWords.add(await anchor.randomPrefix(rand.nextDouble()));
      prefixCount--;
    }

    while (prefixCount > 0) {
      if (prefixWords.first.prefixes.isNotEmpty) {
        var prefix = await prefixWords.first.randomPrefix(rand.nextDouble());
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
      suffixWords.add(await anchor.randomSuffix(rand.nextDouble()));
      suffixCount--;

      while (suffixWords.last.suffixes.isNotEmpty) {
        // if (suffixCount > 0) {
        suffixCount--;
        // }

        var suffix = await suffixWords.last.randomSuffix(rand.nextDouble());
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
