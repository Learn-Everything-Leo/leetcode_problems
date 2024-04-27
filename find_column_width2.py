from ast import List


class Solution:
    def findColumnWidth(self, grid: List[List[int]]) -> List[int]:
        n, m = len(grid), len(grid[0])
        res = [0] * m
        for i in range(n):
            for j in range(m):
                x, length = grid[i][j], 0
                if x <= 0:
                    length, x = 1, -x
                while x != 0:
                    length, x = length + 1, x // 10
                res[j] = max(res[j], length)
        return res