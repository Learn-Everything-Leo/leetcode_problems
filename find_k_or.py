from ast import List


class Solution:
    def findKOr(self, nums: List[int], k: int) -> int:
        res = 0
        mask = 1
        for i in range(32):
           count = 0
           for num in nums:
               count += (num & mask) != 0
           res |= (count >= k) * mask
           mask <<= 1
        return res