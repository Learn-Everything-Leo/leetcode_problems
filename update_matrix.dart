import 'dart:collection';

class Solution {
  void walkMatrix(int i, int j, List<List<int>> mat, int m, int n,
      Queue<List<int>> queue, List<List<bool>> walkMap) {
    if (i - 1 >= 0) {
      if (!walkMap[i - 1][j] && mat[i - 1][j] == 1) {
        mat[i - 1][j] = mat[i][j] + 1;
        queue.addLast([i - 1, j]);
        walkMap[i - 1][j] = true;
      }
    }
    if (i + 1 < m) {
      if (!walkMap[i + 1][j] && mat[i + 1][j] == 1) {
        mat[i + 1][j] = mat[i][j] + 1;
        queue.addLast([i + 1, j]);
        walkMap[i + 1][j] = true;
      }
    }
    if (j - 1 >= 0) {
      if (!walkMap[i][j - 1] && mat[i][j - 1] == 1) {
        mat[i][j - 1] = mat[i][j] + 1;
        queue.addLast([i, j - 1]);
        walkMap[i][j - 1] = true;
      }
    }
    if (j + 1 < n) {
      if (!walkMap[i][j + 1] && mat[i][j + 1] == 1) {
        mat[i][j + 1] = mat[i][j] + 1;
        queue.addLast([i, j + 1]);
        walkMap[i][j + 1] = true;
      }
    }
  }

  List<List<int>> updateMatrix(List<List<int>> mat) {
    int m = mat.length, n = mat[0].length;
    Queue<List<int>> queue = Queue();
    List<List<bool>> walkMap =
        List.generate(m, (index) => List.generate(n, (index) => false));
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 0) {
          queue.addLast([i, j]);
          walkMap[i][j] = true;
        }
      }
    }

    while (queue.isNotEmpty) {
      List<int> point = queue.removeFirst();
      walkMatrix(point.first, point.last, mat, m, n, queue, walkMap);
    }

    return mat;
  }
}
