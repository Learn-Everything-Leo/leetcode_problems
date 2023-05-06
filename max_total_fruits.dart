import 'dart:math';

class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int left = lowerBound(fruits, startPos - k);
    int right = left;
    int n = fruits.length;
    int sum = 0;
    for (; right < n && fruits[right].first <= startPos; right++) {
      sum += fruits[right].last;
    }
    int res = sum;
    for (; right < n && fruits[right].first <= startPos + k; right++) {
      sum += fruits[right].last;
      while (fruits[right].first * 2 - fruits[left].first - startPos > k &&
          fruits[right].first - fruits[left].first * 2 + startPos > k) {
        sum -= fruits[left++].last;
      }
      res = max(res, sum);
    }

    return res;
  }

  int lowerBound(List<List<int>> fruits, int target) {
    int left = 0, right = fruits.length;
    while (left < right) {
      int mid = (left + right) >> 1;
      if (fruits[mid].first < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}
