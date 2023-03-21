class Solution {
  int searchInsert(List<int> nums, int target) {
    if (nums.isEmpty) {
      return 0;
    }
    if (target < nums.first) {
      return 0;
    }
    if (target > nums.last) {
      return nums.length;
    }
    int left = 0, right = nums.length - 1;
    int mid = 0;
    while (left <= right) {
      mid = (left + right) >> 1;
      if (nums[mid] == target) {
        return mid;
      }
      if (target > nums[mid]) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return left;
  }
}
