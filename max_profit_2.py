class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        res = 0
        prev = prices[0]
        for i in range(1, len(prices)):
            if prices[i] > prev:
                res += prices[i] - prev
            prev = prices[i]
        return res