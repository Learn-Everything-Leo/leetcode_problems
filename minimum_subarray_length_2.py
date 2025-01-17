from cmath import inf
from typing import List


class Solution:
    def minimumSubarrayLength(self, nums: List[int], k: int) -> int:
        n = len(nums)
        res = inf
        bits = [0] * 30
        def cal(bits):
            return sum(1 << i for i in range(30) if bits[i] > 0)
       
        left = 0 
        for right in range(n):
            for i in range(30):
                bits[i] += nums[right] >> i & 1
            while left <= right and cal(bits) >= k:
                res = min(res, right - left + 1)
                for i in range(30):
                    bits[i] -= nums[left] >> i & 1
                left += 1
        return res if res != inf else -1