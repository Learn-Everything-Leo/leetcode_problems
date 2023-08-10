class Solution {
  int minFallingPathSum(List<List<int>> grid) {
    int n = grid.length;
    int firstMinSum = 0;
    int secondMinSum = 0;
    int firstMinIndex = -1;
    for (int i = 0; i < n; i++) {
      int currentFirstMinSum = 9223372036854775807;
      int currentSecondMinSum = 9223372036854775807;
      int currentFirstMinIndex = -1;
      for (int j = 0; j < n; j++) {
        int currentSum =
            ((j != firstMinIndex) ? firstMinSum : secondMinSum) + grid[i][j];
        if (currentSum < currentFirstMinSum) {
          currentSecondMinSum = currentFirstMinSum;
          currentFirstMinSum = currentSum;
          currentFirstMinIndex = j;
        } else if (currentSum < currentSecondMinSum) {
          currentSecondMinSum = currentSum;
        }
      }
      firstMinSum = currentFirstMinSum;
      secondMinSum = currentSecondMinSum;
      firstMinIndex = currentFirstMinIndex;
    }

    return firstMinSum;
  }
}
