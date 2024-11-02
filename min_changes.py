class Solution:
    def minChanges(self, n: int, k: int) -> int:
        if n < k:
            return -1
        if n == k:
            return 0
        res = 0
        while n > 0:
            if n & 1 == 1 and k & 1 == 0:
                res += 1
            if n & 1 == 0 and k & 1 == 1:
                return -1
            n >>= 1
            k >>= 1
        return res