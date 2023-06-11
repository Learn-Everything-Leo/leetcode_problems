class Solution {
  List<int> numSmallerByFrequency(List<String> queries, List<String> words) {
    List<int> wordsFrequency = [];
    for (String word in words) {
      wordsFrequency.add(f(word));
    }
    wordsFrequency.sort();
    List<int> result = [];
    for (String query in queries) {
      int queryFrequency = f(query);
      result.add(wordsFrequency.length -
          firstSmallerIndex(queryFrequency, wordsFrequency));
    }
    return result;
  }

  int firstSmallerIndex(int target, List<int> wordsFrequency) {
    int l = 0, r = wordsFrequency.length - 1;
    while (l < r) {
      int mid = (l + r) >> 1;
      if (target >= wordsFrequency[mid]) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return target < wordsFrequency[r] ? r : r + 1;
  }

  int f(String s) {
    int min = 26;
    int count = 0;
    for (int i = 0; i < s.length; i++) {
      if (s.codeUnitAt(i) - 97 < min) {
        min = s.codeUnitAt(i) - 97;
        count = 1;
      } else if (s.codeUnitAt(i) - 97 == min) {
        count++;
      }
    }
    return count;
  }
}
