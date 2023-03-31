import 'dart:math';

class Solution {
  int jump(List<int> nums) {
    int n = nums.length;
    int step = 0;
    List<int> maxRange = [0, 0];
    while (step < n) {
      if (maxRange.last >= n - 1) {
        break;
      }
      int maxRight = maxRange.last;
      for (int i = maxRange.first; i <= maxRange.last; i++) {
        maxRight = max(maxRight, i + nums[i]);
      }
      maxRange = [maxRange.last + 1, maxRight];
      step++;
    }

    return step;
  }
}
