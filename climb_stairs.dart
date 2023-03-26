class Solution {
  int climbStairs(int n) {
    if (n <= 3) {
      return n;
    }
    int a = 1, b = 2, c = 3;
    while (n > 3) {
      a = b;
      b = c;
      c = a + b;
      n--;
    }
    return c;
  }
}

class Solution2 {
  int climbStairs(int n) {
    List<List<int>> a = [
      [1, 1],
      [1, 0]
    ];
    List<List<int>> res = pow(a, n);
    return res[1][0] + res[1][1];
  }

  List<List<int>> pow(List<List<int>> a, int n) {
    List<List<int>> res = [
      [1, 0],
      [0, 1]
    ];
    while (n > 0) {
      if (n & 1 > 0) {
        res = multiple(res, a);
      }
      a = multiple(a, a);
      n >>= 1;
    }
    return res;
  }

  List<List<int>> multiple(List<List<int>> a, List<List<int>> b) {
    List<List<int>> res = [[], []];
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        res[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j];
      }
    }
    return res;
  }
}
