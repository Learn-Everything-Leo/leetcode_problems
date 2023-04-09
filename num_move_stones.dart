import 'dart:math';

class Solution {
  int getMaxMove(List<int> stones) {
    int maxMove1 = 0;
    for (int i = 2; i < stones.length; i++) {
      maxMove1 += (stones[i] - stones[i - 1] - 1);
    }
    stones.sort((a, b) => b.compareTo(a));
    int maxMove2 = 0;
    for (int i = 1; i < stones.length - 1; i++) {
      maxMove2 += (stones[i] - stones[i + 1] - 1);
    }
    return max(maxMove1, maxMove2);
  }

  int getMinMove(List<int> stones) {
    int minMove = 9223372036854775807;
    int n = stones.length;
    int maxOverlapping = 0;
    for (int i = 0; i < n; i++) {
      if (i >= minMove) {
        break;
      }
      int target = stones[i] + n - 1;
      int left = i, right = n - 1;
      while (left <= right) {
        int mid = (left + right) ~/ 2;
        if (stones[mid] <= target) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }
      maxOverlapping = left - i;
      if (n - maxOverlapping == 1 &&
          i <= 1 &&
          stones[left - 1] - stones[i] == left - 1 - i) {
        minMove = min(n - maxOverlapping + 1, minMove);
      } else {
        minMove = min(n - maxOverlapping, minMove);
      }
    }
    return minMove;
  }

  List<int> numMovesStonesII(List<int> stones) {
    stones.sort();
    int minMove = getMinMove(stones);
    int maxMove = getMaxMove(stones);
    return [minMove, maxMove];
  }
}
