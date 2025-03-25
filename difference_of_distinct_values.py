#
# @lc app=leetcode.cn id=2711 lang=python3
#
# [2711] 对角线上不同值的数量差
#

# @lc code=start
from collections import Counter
from typing import List


class Solution:
    def topLeft(self, r: int, c: int, grid: List[List[int]]):
        counter = Counter()
        r -= 1
        c -= 1 
        while r >= 0 and c >= 0:
            counter[grid[r][c]] += 1
            r -= 1
            c -= 1
        return len(counter)
    
    def bottomRight(self, r: int, c: int, grid: List[List[int]], m: int, n: int):
        counter = Counter()
        r += 1
        c += 1
        while r < m and c < n:
            counter[grid[r][c]] += 1
            r += 1
            c += 1
        return len(counter)
            
            
    def differenceOfDistinctValues(self, grid: List[List[int]]) -> List[List[int]]:
        m = len(grid)
        n = len(grid[0])
        res = []
        for i in range(m):
            col = []
            for j in range(n):
               col.append(abs(self.topLeft(i, j, grid) - self.bottomRight(i, j, grid, m, n)))
            res.append(col) 
        return res
        
# @lc code=end

