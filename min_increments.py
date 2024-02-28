from ast import List


class Solution:
    def minIncrements(self, n: int, cost: List[int]) -> int:
        ans = 0
        for i in range(n - 2, 0, -2):
            ans += abs(cost[i] - cost[i + 1])
            # 叶节点 i 和 i+1 的双亲节点下标为 i/2（整数除法）
            cost[i // 2] += max(cost[i], cost[i + 1])
        return ans