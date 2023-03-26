import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    if (nums.length == 1) {
      return nums[0];
    }
    int p = nums[0], q = max(nums[0], nums[1]), r = q;
    for (int i = 2; i < nums.length; i++) {
      r = max(q, p + nums[i]);
      p = q;
      q = r;
    }
    return r;
  }
}
