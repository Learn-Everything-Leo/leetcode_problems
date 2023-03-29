import 'dart:math';

class Solution {
  bool canJump(List<int> nums) {
    int n = nums.length;
    int index = 0;
    int maxEnd = nums[0];
    while (index <= maxEnd && index < n) {
      maxEnd = max(maxEnd, nums[index] + index);
      index++;
    }
    return maxEnd >= (n - 1);
  }
}
