class Solution {
  int longestDecomposition(String text) {
    int n = text.length;
    int res = 1, l = 0, r = n - 1;
    int begin = 0, end = n;
    while (l < r) {
      String left = text.substring(begin, l + 1);
      String right = text.substring(r, end);
      if (left == right) {
        res += 2;
        begin = l + 1;
        end = r;
        if (r == l + 1) {
          res--;
        }
      }
      l++;
      r--;
    }
    return res;
  }
}
