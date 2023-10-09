class Solution:
    def splitNum(self, num: int) -> int:
        nums = []
        while num > 0:
            nums.append(num % 10)
            num //= 10
        nums.sort()
        nums.reverse()
        res = 0
        for i in range(len(nums)):
            res += nums[i] * pow(10, i // 2)
        return res
        