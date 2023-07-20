import 'dart:collection';
import 'dart:math';

class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    HashSet<int> obstaclesMap = HashSet();
    for (int i = 0; i < obstacles.length; i++) {
      obstaclesMap.add(hash(obstacles[i]));
    }
    // 0: north, 1: east, 2: south, 3: west
    int direction = 0;
    List<int> position = [0, 0];
    int res = 0;
    for (int i = 0; i < commands.length; i++) {
      if (commands[i] == -2) {
        direction = (direction + 3) % 4;
        continue;
      }
      if (commands[i] == -1) {
        direction = (direction + 1) % 4;
        continue;
      }
      int move = commands[i];
      while (move > 0) {
        List<int> nextPosition = [...position];
        switch (direction) {
          case 0:
            nextPosition[1]++;
            break;
          case 1:
            nextPosition[0]++;
            break;
          case 2:
            nextPosition[1]--;
            break;
          case 3:
            nextPosition[0]--;
            break;
        }
        if (obstaclesMap.contains(hash(nextPosition))) {
          break;
        }
        res = max(res,
            pow(nextPosition[0], 2).toInt() + pow(nextPosition[1], 2).toInt());
        position = nextPosition;
        move--;
      }
    }
    return res;
  }

  int hash(List<int> point) {
    return point[0] * 100000 + point[1];
  }
}
