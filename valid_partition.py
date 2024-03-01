from ast import List


class Solution:
    def validPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = [False] * (n + 1)
        dp[0] = True
        for i in range(1, n + 1):
            if i >= 2:
                dp[i] = dp[i - 2] and self.validTwo(nums[i - 2], nums[i - 1])
            if i >= 3:
                dp[i] = dp[i] or (dp[i - 3] and self.validThree(nums[i - 3], nums[i - 2], nums[i - 1]))
        return dp[-1]
    
    def validTwo(self, num1: int, num2: int) -> bool:
        return num1 == num2
    
    def validThree(self, num1: int, num2: int, num3: int) -> bool:
        return (num1 == num2 == num3) or (num1 + 2 == num2 + 1 == num3)
