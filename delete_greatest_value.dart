import 'dart:math';

class Solution {
  int deleteGreatestValue(List<List<int>> grid) {
    for (List<int> row in grid) {
      row.sort();
    }
    int n = grid.length, m = grid[0].length;
    int res = 0;
    for (int i = m - 1; i >= 0; i--) {
      int maxNum = 0;
      for (int j = 0; j < n; j++) {
        maxNum = max(maxNum, grid[j][i]);
      }
      res += maxNum;
    }
    return res;
  }
}
