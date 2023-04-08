class Solution {
  String baseNeg2(int n) {
    String res = "";
    while (n != 0) {
      int bit = n & 1;
      res = bit.toString() + res;
      n = (n < 0 && bit != 0) ? ((n ~/ -2) + 1) : (n ~/ -2);
    }
    return res.isEmpty ? "0" : res;
  }
}
