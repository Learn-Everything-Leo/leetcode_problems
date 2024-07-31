from typing import List


class Solution:
    def minRectanglesToCoverPoints(self, points: List[List[int]], w: int) -> int:
        points.sort()
        res = 0
        bound = -1
        for p in points:
            if p[0] > bound:
                bound = p[0] + w
                res += 1
        return res
