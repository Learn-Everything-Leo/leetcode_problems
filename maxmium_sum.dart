import 'dart:math';

class Solution {
  int maximumSum(List<int> arr) {
    int res = arr[0], n = arr.length;
    int dp0 = arr[0], dp1 = -10000;
    for (int i = 1; i < n; i++) {
      dp1 = max(dp1 + arr[i], dp0);
      dp0 = max(dp0, 0) + arr[i];
      res = max(res, max(dp0, dp1));
    }
    return res;
  }
}
