import 'dart:math';

class Solution {
  int minFallingPathSum(List<List<int>> matrix) {
    int n = matrix.length;
    if (n == 1) {
      return matrix[0][0];
    }
    int maxInt = 9223372036854775807;
    List<List<int>> dp =
        List.generate(2, (index) => List.generate(n, (index) => maxInt));

    for (int i = 0; i < n; i++) {
      dp[0][i] = matrix[0][i];
    }

    for (int j = 1; j < n; j++) {
      dp[j % 2][0] = min(dp[(j + 1) % 2][0], dp[(j + 1) % 2][1]) + matrix[j][0];
      dp[j % 2][n - 1] = min(dp[(j + 1) % 2][n - 2], dp[(j + 1) % 2][n - 1]) +
          matrix[j][n - 1];
      for (int k = 1; k < n - 1; k++) {
        dp[j % 2][k] = min(min(dp[(j + 1) % 2][k - 1], dp[(j + 1) % 2][k]),
                dp[(j + 1) % 2][k + 1]) +
            matrix[j][k];
      }
    }

    int res = maxInt;
    for (int i = 0; i < n; i++) {
      res = min(res, dp[(n - 1) % 2][i]);
    }
    return res;
  }
}
