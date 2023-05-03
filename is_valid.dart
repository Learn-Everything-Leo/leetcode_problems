class Solution {
  bool isValid(String s) {
    while (s.isNotEmpty) {
      int n = s.length;
      s = s.replaceAll("abc", "");
      if (n == s.length) {
        break;
      }
    }
    return s.isEmpty;
  }
}
