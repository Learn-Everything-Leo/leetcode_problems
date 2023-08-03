import 'dart:math';

class Solution {
  int maxSubarraySumCircular(List<int> nums) {
    int n = nums.length;
    int preMax = nums[0], maxRes = nums[0];
    int preMin = nums[0], minRes = nums[0];
    int sum = nums[0];
    for (int i = 1; i < n; i++) {
      preMax = max(preMax + nums[i], nums[i]);
      maxRes = max(maxRes, preMax);
      preMin = min(preMin + nums[i], nums[i]);
      minRes = min(minRes, preMin);
      sum += nums[i];
    }
    if (maxRes < 0) {
      return maxRes;
    } else {
      return max(maxRes, sum - minRes);
    }
  }
}
