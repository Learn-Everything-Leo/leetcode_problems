class Solution {
  int countServers(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<int> row = List.generate(m, (index) => 0);
    List<int> column = List.generate(n, (index) => 0);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        row[i] += grid[i][j];
        column[j] += grid[i][j];
      }
    }
    int res = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          res += (row[i] > 1 || column[j] > 1) ? 1 : 0;
        }
      }
    }
    return res;
  }
}
