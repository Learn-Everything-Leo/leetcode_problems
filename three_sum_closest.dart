import 'dart:math';

class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int n = nums.length;
    int start = 0;
    int res = nums[0] + nums[1] + nums[2];
    if (target < res) {
      return res;
    }
    res = nums[n - 3] + nums[n - 2] + nums[n - 1];
    if (target > res) {
      return res;
    }
    int minDiff = 100000;
    while (start < n - 2) {
      int left = start + 1, right = n - 1;
      while (left < right) {
        int sum = nums[start] + nums[left] + nums[right];
        int diff = (sum - target).abs();
        if (diff == 0) {
          return target;
        }
        if (diff < minDiff) {
          minDiff = diff;
          res = sum;
        }
        if (sum < target) {
          left = binarySearch(
              target - sum + nums[left], nums, left + 1, right - 1);
        } else {
          right = min(
              right - 1,
              binarySearch(
                  target - sum + nums[right], nums, left + 1, right - 1));
        }
      }
      start++;
    }
    return res;
  }

  int binarySearch(int target, List<int> nums, int left, int right) {
    while (left < right) {
      int mid = (left + right) >> 1;
      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return left;
  }
}
