from ast import List
from collections import defaultdict


class Solution:
    def numberOfBoomerangs(self, points: List[List[int]]) -> int:
        ans = 0
        for p in points:
            cnt = defaultdict(int)
            for q in points:
                dis = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1])
                cnt[dis] += 1
            for m in cnt.values():
                ans += m * (m - 1)
        return ans
