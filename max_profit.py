class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        minPrice = 10001
        res = 0
        for i in range(1, len(prices)):
            minPrice = min(minPrice, prices[i - 1])
            res = max(res, prices[i] - minPrice)
        return res