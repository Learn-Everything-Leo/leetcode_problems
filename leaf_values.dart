class Solution {
  int mctFromLeafValues(List<int> arr) {
    List<int> stack = [];
    int res = 0;
    for (int x in arr) {
      while (stack.isNotEmpty && stack.last <= x) {
        int y = stack.removeLast();
        if (stack.isEmpty || stack.last > x) {
          res += x * y;
        } else {
          res += stack.last * y;
        }
      }
      stack.add(x);
    }
    while (stack.length >= 2) {
      int x = stack.removeLast();
      res += x * stack.last;
    }
    return res;
  }
}
