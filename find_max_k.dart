class Solution {
  int findMaxK(List<int> nums) {
    nums.sort();
    for (int i = nums.length - 1; i >= 0; i--) {
      if (binarySearch(nums, nums[i] * (-1))) {
        return nums[i];
      }
    }
    return -1;
  }

  bool binarySearch(List<int> nums, int target) {
    int l = 0, r = nums.length;
    while (l < r) {
      int mid = (l + r) >> 1;
      if (nums[mid] == target) {
        return true;
      }
      if (nums[mid] > target) {
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    return l < nums.length && nums[l] == target;
  }
}
