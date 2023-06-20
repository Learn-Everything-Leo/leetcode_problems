import 'dart:math';

class Solution {
  int maxSumDivThree(List<int> nums) {
    int intMinValue = -9223372036854775808;
    List<int> f = [0, intMinValue, intMinValue];
    for (int num in nums) {
      List<int> g = [...f];
      for (int i = 0; i < 3; i++) {
        g[(i + num % 3) % 3] = max(g[(i + num % 3) % 3], f[i] + num);
      }
      f = g;
    }
    return f[0];
  }
}
