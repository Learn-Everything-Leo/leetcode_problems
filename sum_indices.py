from altair import List


class Solution:
    def sumIndicesWithKSetBits(self, nums: List[int], k: int) -> int:
        def bitCount(x: int) -> int:
            cnt = 0
            while x:
                cnt += (x % 2)
                x //= 2
            return cnt
        
        ans = 0
        for i, num in enumerate(nums):
            if bitCount(i) == k:
                ans += num
        return ans
