from ast import List
from collections import defaultdict


class Solution:
    def minimumSeconds(self, nums: List[int]) -> int:
        mp = defaultdict(list)
        res = n = len(nums)
        for i,a in enumerate(nums):
            mp[a].append(i)
        for pos in mp.values():
            mx = pos[0] + n - pos[-1]
            for i in range(len(pos)):
                mx = max(mx, pos[i] - pos[i - 1])
            res = min(res, mx // 2)
        return res