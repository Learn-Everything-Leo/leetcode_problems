from itertools import accumulate


class Solution:
    def maxSatisfaction(self, satisfaction: List[int]) -> int:
        satisfaction.sort(reverse = True)
        f = 0
        for s in accumulate(satisfaction):
            if s < 0:
                break
            f += s
        return f