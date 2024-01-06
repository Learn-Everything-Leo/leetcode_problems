class Solution:
    def prefixesDivBy5(self, nums: List[int]) -> List[bool]:
        n = len(nums)
        res = [False] * n
        num = 0
        for i in range(n):
            num = (num << 1) + nums[i]
            res[i] = num % 5 == 0
        return res