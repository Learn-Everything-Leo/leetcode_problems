import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    if (nums.length == 1) {
      return nums[0];
    }
    if (nums.length == 2) {
      return max(nums[0], nums[1]);
    }
    int p = nums[0], q = max(nums[0], nums[1]), r = q;
    for (int i = 2; i < nums.length - 1; i++) {
      r = max(p + nums[i], q);
      p = q;
      q = r;
    }

    int x = nums[nums.length - 1];
    int y = max(nums[nums.length - 1], nums[nums.length - 2]);
    int z = y;
    for (int i = nums.length - 3; i > 0; i--) {
      z = max(nums[i] + x, y);
      x = y;
      y = z;
    }
    return max(z, r);
  }
}
