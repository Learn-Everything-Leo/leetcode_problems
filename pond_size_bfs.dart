import 'dart:collection';

class Solution {
  List<int> pondSizes(List<List<int>> land) {
    int n = land.length, m = land[0].length;
    List<int> res = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (land[i][j] == 0) {
          res.add(bfs(land, i, j));
        }
      }
    }
    res.sort();
    return res;
  }

  int bfs(List<List<int>> land, int i, int j) {
    int n = land.length, m = land[0].length;
    int res = 0;
    land[i][j] = -1;
    Queue<List<int>> queue = Queue();
    queue.add([i, j]);
    while (queue.isNotEmpty) {
      List<int> pair = queue.removeFirst();
      int x = pair.first, y = pair.last;
      res++;
      for (int dx = -1; dx <= 1; dx++) {
        for (int dy = -1; dy <= 1; dy++) {
          if (dx == 0 && dx == dy) {
            continue;
          }
          if (x + dx < 0 ||
              y + dy < 0 ||
              x + dx >= n ||
              y + dy >= m ||
              land[x + dx][y + dy] != 0) {
            continue;
          }
          land[x + dx][y + dy] = -1;
          queue.addLast([x + dx, y + dy]);
        }
      }
    }
    return res;
  }
}
