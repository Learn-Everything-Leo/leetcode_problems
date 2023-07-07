import 'dart:collection';
import 'dart:math';

class Solution {
  int intMaxValue = 9223372036854775807;

  int findCrossingTime(int n, int k, List<List<int>> time) {
    SplayTreeSet<int> waitLeft = SplayTreeSet((int x, int y) {
      int timeX = time[x][0] + time[x][2];
      int timeY = time[y][0] + time[y][2];
      return timeX != timeY ? timeY - timeX : y - x;
    });
    SplayTreeSet<int> waitRight = SplayTreeSet((int x, int y) {
      int timeX = time[x][0] + time[x][2];
      int timeY = time[y][0] + time[y][2];
      return timeX != timeY ? timeY - timeX : y - x;
    });
    SplayTreeSet<List<int>> workLeft = SplayTreeSet((List<int> x, List<int> y) {
      if (x[0] != y[0]) {
        return x[0] - y[0];
      } else {
        return x[1] - y[1];
      }
    });
    SplayTreeSet<List<int>> workRight =
        SplayTreeSet((List<int> x, List<int> y) {
      if (x[0] != y[0]) {
        return x[0] - y[0];
      } else {
        return x[1] - y[1];
      }
    });
    int remain = n, currentTime = 0;
    for (int i = 0; i < k; i++) {
      waitLeft.add(i);
    }
    while (remain > 0 || waitRight.isNotEmpty || workRight.isNotEmpty) {
      while (workLeft.isNotEmpty && workLeft.first[0] <= currentTime) {
        waitLeft.add(workLeft.first[1]);
        workLeft.remove(workLeft.first);
      }
      while (workRight.isNotEmpty && workRight.first[0] <= currentTime) {
        waitRight.add(workRight.first[1]);
        workRight.remove(workRight.first);
      }
      if (waitRight.isNotEmpty) {
        int id = waitRight.first;
        waitRight.remove(id);
        currentTime += time[id][2];
        workLeft.add([currentTime + time[id][3], id]);
      } else if (remain > 0 && waitLeft.isNotEmpty) {
        int id = waitLeft.first;
        waitLeft.remove(id);
        currentTime += time[id][0];
        workRight.add([currentTime + time[id][1], id]);
        remain--;
      } else {
        int nextTime = intMaxValue;
        if (workLeft.isNotEmpty) {
          nextTime = min(nextTime, workLeft.first[0]);
        }
        if (workRight.isNotEmpty) {
          nextTime = min(nextTime, workRight.first[0]);
        }
        if (nextTime != intMaxValue) {
          currentTime = nextTime;
        }
      }
    }
    return currentTime;
  }
}
