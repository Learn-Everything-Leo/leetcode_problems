class Solution {
  bool isCircularSentence(String sentence) {
    int n = sentence.length;
    List<String> words = [];
    int startIndex = 0;
    for (int i = 0; i < n; i++) {
      if (sentence[i] == ' ') {
        words.add(sentence.substring(startIndex, i));
        startIndex = i + 1;
      }
      if (i == n - 1) {
        words.add(sentence.substring(startIndex));
      }
    }
    int m = words.length;
    for (int i = 0; i < m; i++) {
      if (i == m - 1) {
        if (words[i].substring(words[i].length - 1) !=
            words[0].substring(0, 1)) {
          return false;
        }
      } else if (words[i].substring(words[i].length - 1) !=
          words[i + 1].substring(0, 1)) {
        return false;
      }
    }
    return true;
  }
}
