from ast import List


class Solution:
    def countWays(self, ranges: List[List[int]]) -> int:
        MOD = 10**9 + 7
        ranges.sort()
        n = len(ranges)
        res = 1
        i = 0
        while i < n:
            r = ranges[i][1]
            j = i + 1
            while j < n and ranges[j][0] <= r:
                r = max(r, ranges[j][1])
                j += 1
            res = (res * 2) % MOD
            i = j
        return res