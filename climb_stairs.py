class Solution:
    def climbStairs(self, n: int) -> int:
        a = 1; b = 2
        if n == 1: return a
        if n == 2: return b
        for i in range(3, n+1):
            a, b = b, a+b
        return b
        