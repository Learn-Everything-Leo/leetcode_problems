import 'dart:math';

class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int n = nums.length;
    int preMax = nums[0], maxRes = nums[0];
    int preMin = nums[0], minRes = nums[0];
    for (int i = 1; i < n; i++) {
      preMax = max(preMax + nums[i], nums[i]);
      maxRes = max(maxRes, preMax);
      preMin = min(preMin + nums[i], nums[i]);
      minRes = min(minRes, preMin);
    }
    return max(maxRes.abs(), minRes.abs());
  }
}
