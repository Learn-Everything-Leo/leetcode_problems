import 'dart:math';

class Solution {
  int numTimesAllBlue(List<int> flips) {
    int flag = 1;
    int res = 0;
    for (int i = 0; i < flips.length; i++) {
      if (flips[i] <= i + 1 && flag <= i + 1) {
        res++;
      } else {
        flag = max(flag, flips[i]);
      }
    }
    return res;
  }
}
