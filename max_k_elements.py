from heapq import heapify, heappop, heappush

class Solution:
    def maxKelements(self, nums: List[int], k: int) -> int:
        queue = [-x for x in nums]
        heapify(queue)

        res = 0
        for _ in range(k):
            res += heappop(queue)
            heappush(queue, (res - 2) // 3)
        return -res
