class Solution:
    def minCount(self, coins: List[int]) -> int:
        res = 0
        for coin in coins:
            res += (coin + 1) // 2
        return res