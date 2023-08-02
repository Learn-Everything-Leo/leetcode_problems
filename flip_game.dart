import 'dart:math';

class Solution {
  int flipgame(List<int> fronts, List<int> backs) {
    int n = fronts.length;
    Map<int, bool> map = Map();
    for (int i = 0; i < n; i++) {
      if (fronts[i] == backs[i]) {
        map[fronts[i]] = true;
      }
    }
    int ans = 2001;
    for (int i = 0; i < n; i++) {
      if (!(map[fronts[i]] ?? false)) {
        ans = min(ans, fronts[i]);
      }
      if (!(map[backs[i]] ?? false)) {
        ans = min(ans, backs[i]);
      }
    }
    return ans > 2000 ? 0 : ans;
  }
}
