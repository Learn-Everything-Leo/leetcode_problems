class Solution:
    def findMiddleIndex(self, nums: List[int]) -> int:
        total = 0
        for num in nums:
            total += num
        sum = 0
        for i, num in enumerate(nums):
            if sum == total - sum - num:
                return i
            sum += nums[i]
        return -1