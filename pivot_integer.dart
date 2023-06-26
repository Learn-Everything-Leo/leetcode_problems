import 'dart:math';

class Solution {
  int pivotInteger(int n) {
    int res = pow(n * (n + 1) / 2, 0.5).toInt();
    if (2 * res * res == n * (n + 1)) {
      return res;
    }
    return -1;
  }
}
