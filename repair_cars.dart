import 'dart:math';

class Solution {
  int repairCars(List<int> ranks, int cars) {
    int l = 1, r = ranks.first * cars * cars;
    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (check(mid, ranks, cars)) {
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    return l;
  }

  bool check(int t, List<int> ranks, int cars) {
    int count = 0;
    for (int i = 0; i < ranks.length; i++) {
      count += sqrt(t ~/ ranks[i]).floor();
    }
    return count >= cars;
  }
}
