from functools import lru_cache
import heapq
import math


class Solution:
    def minDays(self, n: int) -> int:
        @lru_cache(None)
        def getHeuristicValue(rest: float) -> int:
            return 0 if rest == 0 else \
                int(math.log(rest) / math.log(3.0)) + 1
        
        q = [(getHeuristicValue(n), 0, n)]
        visited = set()
        ans = 0
        
        while True:
            expected, days, rest = heapq.heappop(q)
            if rest in visited:
                continue
            visited.add(rest)
            if rest == 1:
                ans = days + 1
                break
            heapq.heappush(q, (
                days + rest % 2 + 1 + getHeuristicValue(rest // 2),
                days + rest % 2 + 1,
                rest // 2
            ))
            heapq.heappush(q, (
                days + rest % 3 + 1 + getHeuristicValue(rest // 3),
                days + rest % 3 + 1,
                rest // 3
            ))
        
        return ans
