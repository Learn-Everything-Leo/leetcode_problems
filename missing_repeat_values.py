from ast import List


class Solution:
    def findMissingAndRepeatedValues(self, grid: List[List[int]]) -> List[int]:
        n = len(grid)
        count = [0] * (n * n + 1)
        count[0] = -1
        for i in range(n):
            for j in range(n):
                count[grid[i][j]] += 1
        return [count.index(2), count.index(0)]