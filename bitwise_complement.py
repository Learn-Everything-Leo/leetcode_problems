class Solution:
    def bitwiseComplement(self, n: int) -> int:
        if (n == 0):
            return 1
        res = 0
        i = 0
        while n > 0:
            if (n & 1 == 0):
                res += 1 << i
            i += 1
            n >>= 1
        return res