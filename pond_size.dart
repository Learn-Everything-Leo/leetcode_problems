class Solution {
  int size = 0;

  List<int> pondSizes(List<List<int>> land) {
    int n = land.length, m = land[0].length;
    List<int> res = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (land[i][j] == 0) {
          size = 0;
          dfs(land, i, j);
          res.add(size);
        }
      }
    }
    res.sort();
    return res;
  }

  void dfs(List<List<int>> land, int x, int y) {
    if (x < 0 || x >= land.length || y < 0 || y >= land[0].length) {
      return;
    }
    if (land[x][y] != 0) {
      return;
    }
    size++;
    land[x][y] = -1;
    dfs(land, x - 1, y - 1);
    dfs(land, x - 1, y);
    dfs(land, x - 1, y + 1);
    dfs(land, x, y - 1);
    dfs(land, x, y + 1);
    dfs(land, x + 1, y - 1);
    dfs(land, x + 1, y);
    dfs(land, x + 1, y + 1);
  }
}
