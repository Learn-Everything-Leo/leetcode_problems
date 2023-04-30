class Solution {
  List<int> numMovesStones(int a, int b, int c) {
    List<int> stones = [a, b, c];
    stones.sort();
    int minMoves = 2;
    if (stones[1] - stones[0] == 1 ||
        stones[2] - stones[1] == 1 ||
        stones[1] - stones[0] == 2 ||
        stones[2] - stones[1] == 2) {
      minMoves = 1;
    }
    if (stones[2] - stones[0] == 2) {
      minMoves = 0;
    }
    int maxMoves = stones[2] - stones[0] - 2;
    return [minMoves, maxMoves];
  }
}
