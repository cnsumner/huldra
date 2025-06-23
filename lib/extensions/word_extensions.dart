import 'package:huldra/schema/knowledge_base.dart';
import 'package:injector/injector.dart';

extension WordExtensions on Word {
  Future<String> toFormattedString() async {
    final kb = Injector.appInstance.get<KnowledgeBase>();

    final topPrefixes = await kb.managers.prefixes
        .filter((p) => p.wordHash.wordHash(wordHash))
        .orderBy((p) => p.count.desc())
        .get();

    final topSuffixes = await kb.managers.suffixes
        .filter((s) => s.wordHash.wordHash(wordHash))
        .orderBy((s) => s.count.desc())
        .get();

    final topPrefix = topPrefixes.isNotEmpty
        ? (await kb.getWord(topPrefixes.first.prefixHash)).word
        : '';
    final topSuffix = topSuffixes.isNotEmpty
        ? (await kb.getWord(topSuffixes.first.suffixHash)).word
        : '';

    return '''
```
Word: $word
Total usages: $totalOccurances
Messages used in: $msgOccurances
Top prefix: $topPrefix
Top Suffix: $topSuffix
Example Usage: "$topPrefix $word $topSuffix"
```
''';
  }
}
