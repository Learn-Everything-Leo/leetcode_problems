from ast import List


class Solution:
    def minDeletion(self, nums: List[int]) -> int:
        n = len(nums)
        ans, check = 0, True
        for i in range(n - 1):
            if nums[i] == nums[i + 1] and check:
                ans += 1
            else:
                check = not check
        if (n - ans) % 2 != 0:
            ans += 1
        return ans