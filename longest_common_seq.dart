import 'dart:math';

class Solution {
  int longestCommonSubsequence(String text1, String text2) {
    int n = text1.length, m = text2.length;
    List<List<int>> dp = [
      List.filled(m + 1, 0),
      List.filled(m + 1, 0),
    ];
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (text1[i - 1] == text2[j - 1]) {
          dp[i % 2][j] = dp[(i + 1) % 2][j - 1] + 1;
        } else {
          dp[i % 2][j] = max(dp[(i + 1) % 2][j], dp[i % 2][j - 1]);
        }
      }
    }
    return dp[n % 2][m];
  }
}
