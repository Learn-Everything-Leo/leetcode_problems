from typing import Counter


class Solution:
    def countBalls(self, lowLimit: int, highLimit: int) -> int:
        cnt = Counter(
            sum(map(int, str(i))) for i in range(lowLimit, highLimit + 1)
        )
        return max(cnt.values())