class Solution {
  void dfs(int start, int n, int k, List<int> path, List<List<int>> res) {
    if (path.length == k) {
      res.add([...path]);
      return;
    }
    for (int i = start; i <= n - (k - path.length) + 1; i++) {
      path.add(i);
      dfs(i + 1, n, k, path, res);
      path.removeLast();
    }
  }

  List<List<int>> combine(int n, int k) {
    List<List<int>> res = [];
    dfs(1, n, k, [], res);
    return res;
  }
}
