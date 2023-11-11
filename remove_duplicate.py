from ast import List


class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        for i, x in enumerate(sorted(set(nums))): nums[i] = x
        return i + 1