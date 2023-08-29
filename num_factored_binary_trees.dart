class Solution {
  int numFactoredBinaryTrees(List<int> arr) {
    int modNum = 1000000007;
    arr.sort();
    int res = 0;
    Map<int, int> dp = {};
    for (int i = 0; i < arr.length; i++) {
      dp[arr[i]] = 1;
    }
    for (int i = 1; i < arr.length; i++) {
      for (int j = 0; j < i; j++) {
        int div = arr[i] ~/ arr[j];
        int mod = arr[i] % arr[j];
        if (mod == 0 && dp[div] != null) {
          dp[arr[i]] = dp[arr[i]]! + dp[div]! * dp[arr[j]]! % modNum;
        }
      }
    }
    for (int value in dp.values) {
      res = (res + value) % modNum;
    }
    return res;
  }
}
