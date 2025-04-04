class Solution:
    def maximumOr(self, nums: List[int], k: int) -> int:
        n = len(nums)
        suf = [0] * (n + 1)
        for i in range(n - 1, -1, -1):
            suf[i] = suf[i + 1] | nums[i]
        res = 0
        pre = 0
        for i in range(n):
            res = max(res, pre | (nums[i] << k) | suf[i + 1])
            pre |= nums[i]
        return res