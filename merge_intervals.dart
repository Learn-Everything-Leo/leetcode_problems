import 'dart:math';

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((a, b) {
      return a[0].compareTo(b[0]);
    });
    List<List<int>> res = [];
    for (int i = 0; i < intervals.length; i++) {
      int left = intervals[i][0], right = intervals[i][1];
      if (res.isEmpty || res.last[1] < left) {
        res.add([left, right]);
      } else {
        res.last[1] = max(res.last[1], right);
      }
    }
    return res;
  }
}
