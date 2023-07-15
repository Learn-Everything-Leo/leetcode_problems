class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    List<List<int>> res = [];
    int n = nums.length;
    nums.sort();
    int first = 0;
    while (first < n - 3) {
      int start = first + 1;
      while (start < n - 2) {
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
