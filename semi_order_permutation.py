from typing import List


class Solution:
    def semiOrderedPermutation(self, nums: List[int]) -> int:
        n = len(nums)
        x, y = 0, 0
        for i in range(n):
            if nums[i] == 1:
                x = i
            if nums[i] == n:
                y = i
        return x + (n - y - 1) - (x > y)