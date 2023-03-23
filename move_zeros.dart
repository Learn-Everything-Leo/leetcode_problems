class Solution {
  void swap(List<int> nums, int i, int j) {
    if (i == j) {
      return;
    }
    nums[i] ^= nums[j];
    nums[j] ^= nums[i];
    nums[i] ^= nums[j];
  }

  void moveZeroes(List<int> nums) {
    if (nums.isEmpty) {
      return;
    }
    int left = 0, right = 0;
    while (right < nums.length) {
      if (nums[right] != 0) {
        swap(nums, left, right);
        left++;
      }
      right++;
    }
  }
}
