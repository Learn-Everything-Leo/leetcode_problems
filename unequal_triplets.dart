class Solution {
  int unequalTriplets(List<int> nums) {
    int res = 0;
    int n = nums.length;
    for (int i = 0; i < n - 2; i++) {
      for (int j = i + 1; j < n - 1; j++) {
        if (nums[i] == nums[j]) {
          continue;
        }
        for (int k = j + 1; k < n; k++) {
          if (nums[i] != nums[k] && nums[j] != nums[k]) {
            res++;
          }
        }
      }
    }
    return res;
  }
}
