import 'dart:math';

class Solution {
  int minHeightShelves(List<List<int>> books, int shelfWidth) {
    int n = books.length;
    int maxHeight = 1000 * 1000;
    List<int> dp = List.filled(n + 1, maxHeight);
    dp[0] = 0;
    for (int i = 1; i <= n; i++) {
      int lastLevelHeight = books[i - 1].last;
      int width = 0;
      for (int j = i - 1; j >= 0; j--) {
        width += books[j].first;
        lastLevelHeight = max(lastLevelHeight, books[j].last);
        if (width > shelfWidth) {
          break;
        }
        dp[i] = min(dp[i], dp[j] + lastLevelHeight);
      }
    }
    return dp[n];
  }
}
