from collections import Counter
from typing import List


class Solution:
    def findMatrix(self, nums: List[int]) -> List[List[int]]:
        count = Counter(nums)
        res = []

        while len(count) > 0:
            arr = []
            for key in list(count.keys()):
                count[key] -= 1
                arr.append(key)
                if count[key] == 0:
                    del count[key]
            res.append(arr)
        return res