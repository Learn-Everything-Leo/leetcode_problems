from ast import List
from heapq import heappop, heappush


class Solution:
    def totalCost(self, costs: List[int], k: int, candidates: int) -> int:
        n = len(costs)
        q = list()
        left, right = candidates - 1, n - candidates
        if left + 1 < right:
            for i in range(left + 1):
                heappush(q, (costs[i], i))
            for i in range(right, n):
                heappush(q, (costs[i], i))
        else:
            for i in range(n):
                heappush(q, (costs[i], i))
        
        ans = 0
        for _ in range(k):
            cost, idx = heappop(q)
            ans += cost
            if left + 1 < right:
                if idx <= left:
                    left += 1
                    heappush(q, (costs[left], left))
                else:
                    right -= 1
                    heappush(q, (costs[right], right))
        return ans
