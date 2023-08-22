import 'dart:math';

class Solution {
  int maxDistToClosest(List<int> seats) {
    int n = seats.length;
    int res = 0;
    int start = 0, end = seats.length - 1;
    while (start < n && seats[start] == 0) {
      start++;
    }
    res = max(res, start);
    while (end > start && seats[end] == 0) {
      end--;
    }
    res = max(res, n - 1 - end);
    while (start < end) {
      int current = start + 1;
      while (current < end && seats[current] == 0) {
        current++;
      }
      res = max(res, (current - start) ~/ 2);
      start = current;
    }
    return res;
  }
}
