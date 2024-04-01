class Solution:
    def hasAlternatingBits(self, n: int) -> bool:
        res = n & 1
        n = n >> 1
        while n > 0:
            if (n & 1 != res):
                res = n & 1
                n = n >> 1
            else:
                return False
        return True