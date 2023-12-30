class Solution:
    def minimumSum(self, num: int) -> int:
        nums = [int(x) for x in str(num)]
        nums.sort()
        res = 0
        res += (nums[0] + nums[1]) * 10
        res += nums[2] + nums[3]
        return res