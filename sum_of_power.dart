class Solution {
  int sumOfPower(List<int> nums) {
    nums.sort();
    int n = nums.length;
    int ans = 0, mod = 1000000007;
    int preSum = 0, dp = 0;
    for (int i = 0; i < n; i++) {
      dp = (nums[i] + preSum) % mod;
      preSum = (preSum + dp) % mod;
      ans = (ans + nums[i] * nums[i] % mod * dp) % mod ;
      if (ans < 0) {
        ans += mod;
      }
    }
    return ans;
  }
}
