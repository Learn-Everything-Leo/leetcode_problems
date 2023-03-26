import 'dart:math';

class Solution {
  int deleteAndEarn(List<int> nums) {
    List<int> cnt = List.generate(10000, (index) => 0);
    for (int num in nums) {
      cnt[num - 1] += num;
    }
    int p = cnt[0], q = max(cnt[0], cnt[1]), r = q;
    for (int i = 2; i < 10000; i++) {
      r = max(p + cnt[i], q);
      p = q;
      q = r;
    }
    return r;
  }
}
