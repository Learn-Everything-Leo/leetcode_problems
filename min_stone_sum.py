from ast import List
from heapq import heapify, heappop, heappush


class Solution:
    def minStoneSum(self, piles: List[int], k: int) -> int:
        heap = [-a for a in piles]
        heapify(heap)
        for i in range(k):
            a = -heappop(heap)
            a = a - a//2
            heappush(heap, -a)
        return -sum(heap)