class Solution {
  int waysToBuyPensPencils(int total, int cost1, int cost2) {
    if (cost1 < cost2) {
      int temp = cost1;
      cost1 = cost2;
      cost2 = temp;
    }
    int res = 0;
    int cnt = 0;
    while (cnt * cost1 <= total) {
      res += (total - cost1 * cnt) ~/ cost2 + 1;
      cnt++;
    }
    return res;
  }
}
