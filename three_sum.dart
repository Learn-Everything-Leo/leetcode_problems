class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> res = [];
    int n = nums.length;
    nums.sort();
    int start = 0;
    while (start < n - 2) {
      int left = start + 1, right = n - 1;
      while (left < right) {
        int sum = nums[start] + nums[left] + nums[right];
        if (sum == 0) {
          res.add([nums[start], nums[left], nums[right]]);
          do {
            left++;
          } while (left < right && nums[left] == nums[left - 1]);
        } else if (sum > 0) {
          right--;
        } else {
          left++;
        }
      }
      do {
        start++;
      } while (start < n - 2 && nums[start] == nums[start - 1]);
    }
    return res;
  }
}
