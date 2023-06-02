class Solution {
  List<int> vowelStrings(List<String> words, List<List<int>> queries) {
    List<int> vowelWordsCount = [];
    int count = 0;
    for (int i = 0; i < words.length; i++) {
      if (isVowelString(words[i])) {
        count++;
      }
      vowelWordsCount.add(count);
    }

    List<int> res = [];
    for (int i = 0; i < queries.length; i++) {
      if (queries[i].first == 0) {
        res.add(vowelWordsCount[queries[i].last]);
      } else {
        res.add(vowelWordsCount[queries[i].last] -
            vowelWordsCount[queries[i].first - 1]);
      }
    }

    return res;
  }

  bool isVowelString(String s) {
    String first = s[0];
    String last = s[s.length - 1];
    return (first == 'a' ||
            first == 'e' ||
            first == 'i' ||
            first == 'o' ||
            first == 'u') &&
        (last == 'a' ||
            last == 'e' ||
            last == 'i' ||
            last == 'o' ||
            last == 'u');
  }
}
