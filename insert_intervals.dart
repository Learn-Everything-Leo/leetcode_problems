import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    if (intervals.isEmpty) {
      return [newInterval];
    }
    int length = intervals.length;
    int index = 0;
    while (index < length && newInterval[0] > intervals[index][0]) {
      index++;
    }
    intervals.insert(index, newInterval);
    List<List<int>> res = [intervals[0]];
    for (int i = 1; i < intervals.length; i++) {
      if (res.last[1] < intervals[i][0]) {
        res.add(intervals[i]);
      } else {
        res.last[1] = max(res.last[1], intervals[i][1]);
      }
    }
    return res;
  }
}
