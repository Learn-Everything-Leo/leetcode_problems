from ast import List


class Solution:
    def maxOperations(self, nums: List[int]) -> int:
        n, t = len(nums), 0
        for i in range(1, n, 2):
            if nums[i] + nums[i - 1] != nums[1] + nums[0]:
                break
            t += 1
        return t