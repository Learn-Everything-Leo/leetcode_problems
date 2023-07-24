import 'dart:math';

class Solution {
  int trap(List<int> height) {
    int n = height.length;
    List<int> leftMax = List.generate(n, (index) => 0);
    List<int> rightMax = List.generate(n, (index) => 0);
    leftMax[0] = height[0];
    rightMax[0] = height[n - 1];
    for (int i = 1; i < n; i++) {
      leftMax[i] = max(height[i], leftMax[i - 1]);
      rightMax[i] = max(height[n - 1 - i], rightMax[i - 1]);
    }
    int res = 0;
    for (int i = 1; i < n - 1; i++) {
      res += min(leftMax[i], rightMax[n - 1 - i]) - height[i];
    }
    return res;
  }
}
