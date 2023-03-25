import 'dart:math';

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    int a = 0, b = min(cost[0], cost[1]), c = b;
    for (int i = 2; i < cost.length; i++) {
      c = min(a + cost[i - 1], b + cost[i]);
      a = b;
      b = c;
    }
    return c;
  }
}
