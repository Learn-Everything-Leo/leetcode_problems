class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    int n = temperatures.length;
    List<int> res = List.generate(n, (index) => 0);
    List<int> stack = [];
    for (int i = n - 1; i >= 0; i--) {
      while (stack.isNotEmpty && temperatures[stack.last] <= temperatures[i]) {
        stack.removeLast();
      }
      res[i] = stack.isEmpty ? 0 : stack.last - i;
      stack.add(i);
    }

    return res;
  }

  List<int> dailyTemperatures2(List<int> temperatures) {
    int n = temperatures.length;
    List<int> res = List.generate(n, (index) => 0);
    List<int> stack = [];
    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && temperatures[i] > temperatures[stack.last]) {
        int j = stack.removeLast();
        res[j] = i - j;
      }
      stack.add(i);
    }

    return res;
  }
}
