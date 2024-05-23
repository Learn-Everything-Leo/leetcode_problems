from ast import List
from collections import defaultdict


class Solution:
    def longestEqualSubarray(self, nums: List[int], k: int) -> int:
        pos = defaultdict(list)
        for i, num in enumerate(nums):
            pos[num].append(i)
        
        res = 0
        for array in pos.values():
            l = 0
            for r in range(len(array)):
                while array[r] - array[l] - (r - l) > k:
                    l += 1
                res = max(res, r - l + 1)
        return res
                