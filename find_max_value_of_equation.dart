import 'dart:math';

import 'priority_queue.dart';

class Solution {
  int intMinValue = -9223372036854775808;
  int findMaxValueOfEquation(List<List<int>> points, int k) {
    int res = intMinValue;
    PriorityQueue<List<int>> priorityQueue =
        PriorityQueue((a, b) => a[0] - b[0]);
    for (List<int> point in points) {
      int x = point[0], y = point[1];
      while (priorityQueue.isNotEmpty && x - priorityQueue.first[1] > k) {
        priorityQueue.removeFirst();
      }
      if (priorityQueue.isNotEmpty) {
        res = max(res, x + y - priorityQueue.first[0]);
      }
      priorityQueue.add([x - y, x]);
    }
    return res;
  }
}
