class Solution {
  List<int> sortedSquares(List<int> nums) {
    if (nums.isEmpty) {
      return [];
    }
    List<int> result = [];
    int p1 = nums.length - 2, p2 = nums.length - 1;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] >= 0) {
        p2 = i;
        p1 = i - 1;
        break;
      }
    }
    while (p1 >= 0 || p2 < nums.length) {
      if (p1 < 0) {
        while (p2 < nums.length) {
          result.add(nums[p2] * nums[p2]);
          p2++;
        }
        break;
      }
      if (p2 >= nums.length) {
        while (p1 >= 0) {
          result.add(nums[p1] * nums[p1]);
          p1--;
        }
        break;
      }
      if (nums[p1].abs() <= nums[p2].abs()) {
        result.add(nums[p1] * nums[p1]);
        p1--;
      } else {
        result.add(nums[p2] * nums[p2]);
        p2++;
      }
    }
    return result;
  }
}
