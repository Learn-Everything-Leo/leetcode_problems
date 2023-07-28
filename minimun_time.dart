import 'dart:collection';
import 'dart:math';

class Solution {
  int minimumTime(int n, List<List<int>> relations, List<int> time) {
    List<List<int>> graph = List.generate(n + 1, (index) => []);
    List<int> deg = List.generate(n + 1, (index) => 0);
    for (List<int> relation in relations) {
      graph[relation[0]].add(relation[1]);
      deg[relation[1]]++;
    }
    Queue<int> queue = Queue();
    for (int i = 1; i <= n; i++) {
      if (deg[i] == 0) {
        queue.add(i);
      }
    }
    List<int> maxTime = List.generate(n + 1, (index) => 0);
    int ans = 0;
    while (queue.isNotEmpty) {
      int x = queue.removeFirst();
      maxTime[x] += time[x - 1];
      ans = max(ans, maxTime[x]);
      for (int y in graph[x]) {
        maxTime[y] = max(maxTime[y], maxTime[x]);
        if (--deg[y] == 0) {
          queue.add(y);
        }
      }
    }
    return ans;
  }
}
