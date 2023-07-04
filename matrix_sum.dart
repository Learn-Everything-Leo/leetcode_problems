import 'dart:math';

class Solution {
  int matrixSum(List<List<int>> nums) {
    int res = 0, n = nums.length, m = nums[0].length;
    for (int i = 0; i < n; i++) {
      nums[i].sort();
    }
    for (int i = m - 1; i >= 0; i--) {
      int maxValue = nums[0][i];
      for (int j = 1; j < n; j++) {
        maxValue = max(maxValue, nums[j][i]);
      }
      res += maxValue;
    }
    return res;
  }
}
