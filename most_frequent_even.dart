import 'dart:math';

class Solution {
  int mostFrequentEven(List<int> nums) {
    List<int> evenNums = nums.where((element) => element % 2 == 0).toList();
    if (evenNums.isEmpty) {
      return -1;
    }
    Map<int, int> map = {};
    List<int> maxRes = [0, 0];
    evenNums.forEach((e) {
      map[e] = (map[e] != null) ? map[e]! + 1 : 1;
      if (map[e]! > maxRes.last) {
        maxRes = [e, map[e]!];
      } else if (map[e]! == maxRes.last) {
        maxRes = [min(e, maxRes.first), map[e]!];
      }
    });
    return maxRes.first;
  }
}
