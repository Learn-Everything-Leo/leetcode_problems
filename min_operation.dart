import 'dart:math';

class Solution {
  int minOperations(List<int> nums) {
    int res = 0;
    int maxCount = 0;
    for (int num in nums) {
      if (num == 0) {
        continue;
      }
      int count = 0;
      while (num > 0) {
        res += num & 1;
        num >>= 1;
        if (num > 0) {
          count++;
        }
      }
      maxCount = max(maxCount, count);
    }

    return res + maxCount;
  }
}
