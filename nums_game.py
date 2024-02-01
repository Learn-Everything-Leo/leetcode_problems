from ast import List
from heapq import heappop, heappush


class Solution:
    def numsGame(self, nums: List[int]) -> List[int]:
        n = len(nums)
        res = [0] * n
        lower, upper = [], []
        lowerSum, upperSum = 0, 0
        mod = int(1e9 + 7)
        for i in range(n):
            x = nums[i] - i
            if len(lower) == 0 or -lower[0] >= x:
                lowerSum += x
                heappush(lower, -x)
                if len(lower) > len(upper) + 1:
                    upperSum -= lower[0]
                    heappush(upper, -lower[0])
                    lowerSum += heappop(lower)
            else:
                upperSum += x
                heappush(upper, x)
                if len(lower) < len(upper):
                    lowerSum += upper[0]
                    heappush(lower, -upper[0])
                    upperSum -= heappop(upper)
            if (i + 1) % 2 == 0:
                res[i] = (upperSum - lowerSum) % mod
            else:
                res[i] = (upperSum - lowerSum - lower[0]) % mod
        return res