class Solution:
    def findChampion(self, grid: List[List[int]]) -> int:
        ans = 0
        for i in range(len(grid)):
            if grid[i][ans] == 1:
                ans = i
        return ans