class Solution {
  bool queryString(String s, int n) {
    if (n > 255) {
      return false;
    }

    for (int i = n; i > n ~/ 2; i--) {
      if (!s.contains(i.toRadixString(2))) {
        return false;
      }
    }
    return true;
  }
}
