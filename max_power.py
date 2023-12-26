class Solution:
    def maxPower(self, s: str) -> int:
        res = 0
        cur = 0
        prev = ''
        for c in s:
            if c == prev:
                cur += 1
            else:
                cur = 1
            res = max(res, cur)
            prev = c
        return res