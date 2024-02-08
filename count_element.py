from ast import List


class Solution:
    def countElements(self, nums: List[int]) -> int:
        minValue = min(nums)
        maxValue = max(nums)
        count = 0
        for i in range(0, len(nums)):
            if (nums[i] != minValue and nums[i] != maxValue):
                count += 1
        return count