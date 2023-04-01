class Solution {
  bool isAllRotted(List<List<int>> grid) {
    int row = grid.length, column = grid[0].length;
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        if (grid[i][j] == 1) {
          return false;
        }
      }
    }
    return true;
  }

  List<List<int>> rotting(List<List<int>> grid, int x, int y) {
    List<List<int>> directions = [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ];
    List<List<int>> res = [];
    for (int i = 0; i < directions.length; i++) {
      int sx = x + directions[i][0];
      int sy = y + directions[i][1];
      if (sx >= 0 && sx < grid.length && sy >= 0 && sy < grid[0].length) {
        if (grid[sx][sy] == 1) {
          grid[sx][sy] = 2;
          res.add([sx, sy]);
        }
      }
    }

    return res;
  }

  int orangesRotting(List<List<int>> grid) {
    int row = grid.length, column = grid[0].length;
    List<List<int>> rotted = [];
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        if (grid[i][j] == 2) {
          rotted.add([i, j]);
        }
      }
    }
    int day = 0;
    while (!isAllRotted(grid)) {
      if (rotted.isEmpty) {
        break;
      }
      List<List<int>> nextRoundRotted = [];
      for (List<int> rottedOrange in rotted) {
        nextRoundRotted.addAll(rotting(grid, rottedOrange[0], rottedOrange[1]));
      }
      rotted = nextRoundRotted;
      day++;
    }

    return isAllRotted(grid) ? day : -1;
  }
}
