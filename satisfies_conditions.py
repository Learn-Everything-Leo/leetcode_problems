from typing import List


class Solution:
    def satisfiesConditions(self, grid: List[List[int]]) -> bool:
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if i + 1 < len(grid) and grid[i][j] != grid[i + 1][j]:
                    return False
                if j + 1 < len(grid[0]) and grid[i][j] == grid[i][j + 1]:
                    return False
        return True