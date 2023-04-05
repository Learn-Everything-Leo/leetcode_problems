import 'dart:math';

class Solution {
  int commonFactors(int a, int b) {
    int smallerInt = a <= b ? a : b;
    int biggerInt = a > b ? a : b;
    int res = 0;
    for (int i = 1; i <= sqrt(smallerInt); i++) {
      if (smallerInt % i == 0) {
        if (biggerInt % i == 0) {
          res++;
        }
        if (i * i != smallerInt && (biggerInt % (smallerInt ~/ i)) == 0) {
          res++;
        }
      }
    }
    return res;
  }
}
