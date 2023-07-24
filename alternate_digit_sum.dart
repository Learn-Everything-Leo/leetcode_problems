class Solution {
  int alternateDigitSum(int n) {
    int res = 0;
    int factor = n.toString().length % 2 == 0 ? -1 : 1;
    while (n > 0) {
      res += n % 10 * factor;
      factor *= -1;
      n = n ~/ 10;
    }
    return res;
  }
}
