from altair import List


class Solution:
    def findLengthOfLCIS(self, nums: List[int]) -> int:
        res = 0
        l = 0
        for i in range(len(nums)):
            if i and nums[i-1] >= nums[i]:
                l = i
            res = max(res, i - l + 1)
        return res