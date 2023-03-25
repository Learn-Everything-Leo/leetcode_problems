import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int left = 0, right = 0, ret = 0;
    Map<String, int> map = {};
    s.split('').forEach((char) {
      if (map[char] == null) {
        map[char] = right;
      } else {
        ret = max(ret, right - left);
        left = max(left, map[char]! + 1);
        map[char] = right;
      }
      right++;
    });
    return max(ret, right - left);
  }
}
