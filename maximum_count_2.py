from ast import List


class Solution:
    def lowerBound(self, nums, val):
        l, r = 0, len(nums)
        while l < r:
            m = (l + r) // 2
            if nums[m] >= val:
                r = m
            else:
                l = m + 1
        return l

    def maximumCount(self, nums: List[int]) -> int:
        pos1 = self.lowerBound(nums, 0)
        pos2 = self.lowerBound(nums, 1)
        return max(pos1, len(nums) - pos2)

            
                