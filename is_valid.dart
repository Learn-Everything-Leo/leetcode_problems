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

  bool isValid2(String s) {
    List<String> stack = [];
    int n = s.length;
    for (int i = 0; i < n; i++) {
      if (s[i] == 'c') {
        if (stack.length < 2 ||
            stack.removeLast() != 'b' ||
            stack.removeLast() != 'a') {
          return false;
        }
      } else {
        stack.add(s[i]);
      }
    }
    return stack.isEmpty;
  }
}
