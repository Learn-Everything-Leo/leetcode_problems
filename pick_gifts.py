from ast import List
from cmath import sqrt
from heapq import heapify, heappop, heappush


class Solution:
    def pickGifts(self, gifts: List[int], k: int) -> int:
        q = [-gift for gift in gifts]
        heapify(q)
        while k:
            x = heappop(q)
            heappush(q, -int(sqrt(-x)))
            k -= 1
        return -sum(q)