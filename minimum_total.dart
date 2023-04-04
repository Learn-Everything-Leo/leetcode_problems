import 'dart:math';

class Solution {
  int minimumTotal(List<List<int>> triangle) {
    int n = triangle.length;
    List<List<int>> dp = List.generate(n, (index) => []);
    dp[0].add(triangle[0][0]);
    for (int i = 1; i < n; i++) {
      dp[i].add(dp[i - 1][0] + triangle[i][0]);
      for (int j = 1; j < i; j++) {
        dp[i].add(min(dp[i - 1][j - 1], dp[i - 1][j]) + triangle[i][j]);
      }
      dp[i].add(dp[i - 1][i - 1] + triangle[i][i]);
    }
    int res = dp[n - 1][0];
    for (int i = 1; i < n; i++) {
      res = min(dp[n - 1][i], res);
    }
    return res;
  }
}
