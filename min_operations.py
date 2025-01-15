from heapq import heapify, heappop, heappush
from typing import List


class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        count = 0
        h = nums[:]
        heapify(h)
        while h[0] < k:
            x1 = heappop(h)
            x2 = heappop(h)
            heappush(h, 2 * x1 + x2)
            count += 1
        return count
            