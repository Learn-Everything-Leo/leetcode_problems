from bisect import bisect_left


class Solution:
    def findMaximumNumber(self, k: int, x: int) -> int:
        def count(num: int) -> int:
            res = 0
            i = x - 1
            n = num >> i
            while n:
                res += (n // 2) << i
                if n % 2:
                    mask = (1 << i) - 1
                    res += (num & mask) + 1
                i += x
                n >>= x
            return res
        return bisect_left(range((k + 1) << x), k + 1, key=count) - 1