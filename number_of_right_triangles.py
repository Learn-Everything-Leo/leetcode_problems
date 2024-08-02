from typing import List


class Solution:
    def numberOfRightTriangles(self, grid: List[List[int]]) -> int:
        n = len(grid)
        m = len(grid[0])
        res = 0
        dpH = [[0] * m for _ in range(n)]
        dpV = [[0] * m for _ in range(n)]
        for i in range(n):
            for j in range(m):
                if j > 0:
                    dpH[i][j] = grid[i][j] + dpH[i][j - 1]
                else:
                    dpH[i][j] = grid[i][j]
                if i > 0:
                    dpV[i][j] = grid[i][j] + dpV[i - 1][j]
                else:
                    dpV[i][j] = grid[i][j]
        for i in range(n):
            for j in range(m):
                if (grid[i][j] == 1):
                    res += (dpH[i][m - 1] - dpH[i][j]) * (dpV[n - 1][j] - dpV[i][j])
                    if (i > 0):
                        res += dpV[i - 1][j] * (dpH[i][m - 1] - dpH[i][j])
                    if (j > 0):
                        res += dpH[i][j - 1] * (dpV[n - 1][j] - dpV[i][j])
                    if (i > 0 and j > 0):
                        res += dpH[i][j - 1] * dpV[i - 1][j]
        return res
                