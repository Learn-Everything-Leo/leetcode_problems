class TreeAncestor {
  List<List<int>> dp = [];
  static const int log = 16;

  TreeAncestor(int n, List<int> parent) {
    dp = List.generate(n, (index) => List.generate(log, (index) => -1));
    for (int i = 0; i < n; i++) {
      dp[i][0] = parent[i];
    }
    for (int j = 1; j < log; j++) {
      for (int i = 0; i < n; i++) {
        if (dp[i][j - 1] != -1) {
          dp[i][j] = dp[dp[i][j - 1]][j - 1];
        }
      }
    }
  }

  int getKthAncestor(int node, int k) {
    for (int j = 0; j < log; j++) {
      if (((k >> j) & 1) != 0) {
        node = dp[node][j];
        if (node == -1) {
          return -1;
        }
      }
    }
    return node;
  }
}

/**
 * Your TreeAncestor object will be instantiated and called as such:
 * TreeAncestor obj = TreeAncestor(n, parent);
 * int param1 = obj.getKthAncestor(node,k);
 */