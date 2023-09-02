import 'dart:math';

class Solution {
  int captureForts(List<int> forts) {
    int res = 0, pre = -1;
    for (int i = 0; i < forts.length; i++) {
      if (forts[i] == 1 || forts[i] == -1) {
        if (pre >= 0 && forts[i] != forts[pre]) {
          res = max(res, i - pre - 1);
        }
        pre = i;
      }
    }
    return res;
  }
}
