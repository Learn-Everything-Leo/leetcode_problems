from functools import cache
from typing import List


class Solution:
    def minimumCoins(self, prices: List[int]) -> int:

        @cache
        def dp(index: int) -> int:
            if 2 * index + 2 >= len(prices):
                return prices[index]
            return prices[index] + min(dp(i) for i in range(index + 1, 2 * index + 3))
        return dp(0)