import 'dart:math';

class Solution {
  int maxAlternatingSum(List<int> nums) {
    int n = nums.length;
    int even = nums[0], odd = 0;
    for (int i = 1; i < n; i++) {
      int lastEven = even;
      even = max(odd + nums[i], even);
      odd = max(lastEven - nums[i], odd);
    }
    return even;
  }
}
