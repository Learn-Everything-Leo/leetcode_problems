from typing import List


class Solution:
    def maxCoins(self, piles: List[int]) -> int:
        n = len(piles)
        piles.sort()
        return sum(piles[n // 3 :: 2])