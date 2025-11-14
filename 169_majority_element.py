class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        count = 1
        candidate = nums[0]
        for i in range(1, len(nums)):
            if nums[i] == candidate:
                count += 1
            elif count == 0:
                candidate = nums[i]
                count = 1
            else:
                count -= 1
        return candidate