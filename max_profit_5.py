class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)
        profit = 0
        buy = prices[0] + fee
        for i in range(1, n):
            if prices[i] + fee < buy:
                buy = prices[i] + fee
            elif prices[i] > buy:
                profit += prices[i] - buy
                buy = prices[i]
        return profit