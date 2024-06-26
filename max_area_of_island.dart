import 'dart:collection';
import 'dart:math';

class Solution {
  int area(List<List<int>> grid, int x, int y) {
    int r = grid.length, c = grid[0].length;
    if (x < 0 || y < 0 || x >= r || y >= c) {
      return 0;
    }
    if (grid[x][y] == 0) {
      return 0;
    }
    grid[x][y] = 0;
    List<int> areas = [
      area(grid, x + 1, y),
      area(grid, x - 1, y),
      area(grid, x, y + 1),
      area(grid, x, y - 1)
    ];
    int res = 1;
    for (int singleArea in areas) {
      res += singleArea;
    }
    return res;
  }

  int maxAreaOfIsland(List<List<int>> grid) {
    int r = grid.length, c = grid[0].length;
    int res = 0;
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (grid[i][j] == 1) {
          res = max(res, area(grid, i, j));
        }
      }
    }
    return res;
  }
}

class Solution2 {
  int area(List<List<int>> grid, int x, int y) {
    int r = grid.length, c = grid[0].length;
    if (x < 0 || y < 0 || x >= r || y >= c) {
      return 0;
    }
    if (grid[x][y] == 0) {
      return 0;
    }

    int res = 0;
    Queue<List<int>> queue = Queue();
    queue.add([x, y]);
    while (queue.isNotEmpty) {
      List<int> index = queue.removeFirst();
      if (index.first < 0 ||
          index.last < 0 ||
          index.first >= r ||
          index.last >= c) {
        continue;
      }
      if (grid[index.first][index.last] == 1) {
        res++;
        queue.add([index.first + 1, index.last]);
        queue.add([index.first - 1, index.last]);
        queue.add([index.first, index.last + 1]);
        queue.add([index.first, index.last - 1]);
        grid[index.first][index.last] = 0;
      }
    }
    return res;
  }

  int maxAreaOfIsland(List<List<int>> grid) {
    int r = grid.length, c = grid[0].length;
    int res = 0;
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (grid[i][j] == 1) {
          res = max(res, area(grid, i, j));
        }
      }
    }
    return res;
  }
}
