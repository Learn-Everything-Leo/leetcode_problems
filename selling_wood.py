from ast import List
from functools import cache


class Solution:
    def sellingWood(self, m: int, n: int, prices: List[List[int]]) -> int:
        value = dict()

        @cache
        def dfs(x: int, y: int) -> int:
            ret = value.get((x, y), 0)

            if x > 1:
                for i in range(1, x):
                    ret = max(ret, dfs(i, y) + dfs(x - i, y))
            
            if y > 1:
                for j in range(1, y):
                    ret = max(ret, dfs(x, j) + dfs(x, y - j))
            
            return ret
        
        for (h, w, price) in prices:
            value[(h, w)] = price
        
        ans = dfs(m, n)
        dfs.cache_clear()
        return ans
