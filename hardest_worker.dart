import 'dart:math';

class Solution {
  int hardestWorker(int n, List<List<int>> logs) {
    logs.insert(0, [0, 0]);
    int id = 0;
    int maxTime = 0;
    for (int i = 1; i < logs.length; i++) {
      int time = logs[i].last - logs[i - 1].last;
      if (time > maxTime) {
        id = logs[i].first;
        maxTime = time;
      } else if (time == maxTime) {
        id = min(id, logs[i].first);
      }
    }
    return id;
  }
}
