class Solution {
  int equalPairs(List<List<int>> grid) {
    int length = grid.length;
    int res = 0;
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
        bool flag = true;
        for (int k = 0; k < length; k++) {
          if (grid[i][k] != grid[k][j]) {
            flag = false;
            break;
          }
        }
        if (flag) {
          res++;
        }
      }
    }
    return res;
  }
}
