import 'priority_queue.dart';

class Solution {
  List<int> minInterval(List<List<int>> intervals, List<int> queries) {
    int n = queries.length;
    int m = intervals.length;
    List<int> res = List.generate(n, (index) => -1);
    List<int> qIndexList = List.generate(n, (index) => index);
    qIndexList.sort((int x, int y) => queries[x].compareTo(queries[y]));
    intervals.sort((List<int> x, List<int> y) => x.first.compareTo(y.first));
    PriorityQueue<List<int>> priorityQueue =
        PriorityQueue((List<int> x, List<int> y) => x[0].compareTo(y[0]));
    int i = 0;
    for (int j = 0; j < n; j++) {
      int query = queries[qIndexList[j]];
      while (i < m && query >= intervals[i][0]) {
        priorityQueue.add([
          intervals[i][1] - intervals[i][0] + 1,
          intervals[i][0],
          intervals[i][1]
        ]);
        i++;
      }
      while (priorityQueue.isNotEmpty && priorityQueue.first[2] < query) {
        priorityQueue.removeFirst();
      }
      if (priorityQueue.isNotEmpty) {
        res[qIndexList[j]] = priorityQueue.first[0];
      }
    }
    return res;
  }
}
