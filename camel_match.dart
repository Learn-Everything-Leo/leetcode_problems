class Solution {
  List<bool> camelMatch(List<String> queries, String pattern) {
    List<bool> res = [];
    for (String query in queries) {
      bool flag = true;
      int p = 0;
      for (int i = 0; i < query.length; i++) {
        if (p < pattern.length && query[i] == pattern[p]) {
          p++;
          continue;
        } else if (query[i] == query[i].toUpperCase()) {
          flag = false;
          break;
        }
      }
      if (p < pattern.length) {
        flag = false;
      }
      res.add(flag);
    }
    return res;
  }
}
