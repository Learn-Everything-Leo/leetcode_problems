class Solution {
  int closedIsland(List<List<int>> grid) {
    List<int> valueList = [];
    int value = 1;
    int n = grid.length, m = grid[0].length;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (grid[i][j] == 0) {
          dfs(grid, i, j, ++value);
          valueList.add(value);
        }
        if (grid[i][j] == 1) {
          continue;
        }
        if (i == 0 || j == 0 || i == n - 1 || j == m - 1) {
          valueList.remove(grid[i][j]);
        }
      }
    }
    return valueList.length;
  }

  void dfs(List<List<int>> grid, int row, int col, int value) {
    if (row >= 0 && col >= 0 && row < grid.length && col < grid[0].length) {
      if (grid[row][col] == 0) {
        grid[row][col] = value;
        dfs(grid, row + 1, col, value);
        dfs(grid, row, col + 1, value);
        dfs(grid, row - 1, col, value);
        dfs(grid, row, col - 1, value);
      }
    }
  }
}
