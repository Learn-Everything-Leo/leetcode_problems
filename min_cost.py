from ast import List


class Solution:
    def minCost(self, nums: List[int], x: int) -> int:
        n = len(nums)
        f = nums[:]
        ans = sum(f)

        for k in range(1, n):
            for i in range(n):
                f[i] = min(f[i], nums[(i + k) % n])
            ans = min(ans, k * x + sum(f))
        
        return ans