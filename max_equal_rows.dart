import 'dart:math';

class Solution {
  int maxEqualRowsAfterFlips(List<List<int>> matrix) {
    int m = matrix.length, n = matrix[0].length;
    Map<String, int> map = {};
    int res = 1;
    for (int i = 0; i < m; i++) {
      StringBuffer key = StringBuffer();
      for (int j = 0; j < n; j++) {
        key.write(matrix[i][j] ^ matrix[i][0]);
      }
      if (map[key.toString()] == null) {
        map[key.toString()] = 1;
      } else {
        map[key.toString()] = map[key.toString()]! + 1;
      }
      res = max(res, map[key.toString()]!);
    }
    return res;
  }
}
