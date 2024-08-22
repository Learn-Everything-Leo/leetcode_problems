class Solution:
    def minEnd(self, n: int, x: int) -> int:
        res = x
        m = n - 1
        i, j = 0, 0
        while m >> j:
            if (res >> i & 1) == 0:
                res |= (m >> j & 1) << i
                j += 1
            i += 1
        return res