from ast import List


class Solution:
    def minimumCost(self, cost: List[int]) -> int:
        res = 0
        n = len(cost)
        cost.sort()
        cost = cost[::-1]
        for i in range(0, n, 3):
            if (i + 1 < n):
                res += cost[i] + cost[i + 1]
            else:
                res += cost[i]
        return res
            

        