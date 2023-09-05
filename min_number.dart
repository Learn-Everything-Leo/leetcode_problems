import 'dart:math';

class Solution {
  int minNumber(List<int> nums1, List<int> nums2) {
    int res = 99;
    int x = 99;
    int y = 99;
    for (int i = 0; i < nums1.length; i++) {
      x = min(x, nums1[i]);
      for (int j = 0; j < nums2.length; j++) {
        y = min(y, nums2[j]);
        if (nums1[i] == nums2[j]) {
          res = min(res, nums1[i]);
          break;
        }
      }
    }
    if (res != 99) {
      return res;
    }
    return min(x * 10 + y, y * 10 + x);
  }
}
