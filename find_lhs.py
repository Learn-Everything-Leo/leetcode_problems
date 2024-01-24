from altair import List


class Solution:
    def findLHS(self, nums: List[int]) -> int:
        nums.sort()
        res, begin = 0, 0
        for end in range(len(nums)):
            while nums[end] - nums[begin] > 1:
                begin += 1
            if nums[end] - nums[begin] == 1:
                res = max(res, end - begin + 1)
        return res
