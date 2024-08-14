from ast import List


class Solution:
    def isArraySpecial(self, nums: List[int], queries: List[List[int]]) -> List[bool]:
        n = len(nums)
        dp = [1] * n
        for i in range(1, n):
            if (nums[i] ^ nums[i - 1]) & 1 == 1:
                dp[i] = dp[i - 1] + 1
        return [dp[y] >= y - x + 1 for x, y in queries]
