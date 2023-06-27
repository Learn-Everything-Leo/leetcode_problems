class Solution {
  List<List<String>> partition(String s) {
    List<List<String>> res = [];
    dfs(res, s, 0, s.length, []);
    return res;
  }

  void dfs(List<List<String>> res, String s, int i, int n, List<String> path) {
    if (i == n) {
      res.add([...path]);
      return;
    }
    for (int j = i; j < n; j++) {
      String sub = s.substring(i, j + 1);
      if (isPalindrome(sub)) {
        path.add(sub);
        dfs(res, s, j + 1, n, path);
        path.removeLast();
      }
    }
  }

  bool isPalindrome(String s) {
    int n = s.length;
    for (int i = 0; i < n ~/ 2; i++) {
      if (s[i] != s[n - 1 - i]) {
        return false;
      }
    }
    return true;
  }
}
