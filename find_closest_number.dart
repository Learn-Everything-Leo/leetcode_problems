import 'dart:math';

class Solution {
  int findClosestNumber(List<int> nums) {
    int res = nums[0];
    int closestToZero = nums[0].abs();
    for (int i = 1; i < nums.length; i++) {
      if (nums[i].abs() < closestToZero) {
        res = nums[i];
        closestToZero = nums[i].abs();
      } else if (nums[i].abs() == closestToZero) {
        res = max(res, nums[i]);
      }
    }
    return res;
  }
}
