class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    List<List<int>> res = [];
    int n = nums.length;
    nums.sort();
    int first = 0;
    while (first < n - 3) {
      if (nums[first] + nums[first + 1] + nums[first + 2] + nums[first + 3] >
          target) {
        break;
      }
      while (first < n - 3 &&
          nums[first] + nums[n - 1] + nums[n - 2] + nums[n - 3] < target) {
        first++;
      }
      int start = first + 1;
      while (start < n - 2) {
        if (nums[first] + nums[start] + nums[start + 1] + nums[start + 2] >
            target) {
          break;
        }
        while (start < n - 2 &&
            nums[first] + nums[start] + nums[n - 1] + nums[n - 2] < target) {
          start++;
        }
        int left = start + 1, right = n - 1;
        while (left < right) {
          int sum = nums[first] + nums[start] + nums[left] + nums[right];
          if (sum == target) {
            res.add([nums[first], nums[start], nums[left], nums[right]]);
            do {
              left++;
            } while (left < right && nums[left] == nums[left - 1]);
          } else if (sum > target) {
            right--;
          } else {
            left++;
          }
        }
        do {
          start++;
        } while (start < n - 2 && nums[start] == nums[start - 1]);
      }
      do {
        first++;
      } while (first < n - 3 && nums[first] == nums[first - 1]);
    }
    return res;
  }
}
