class Solution:
    def minimumSum(self, n: int, k: int) -> int:
        if n <= k // 2:
            return self.arithmeticSeriesSum(1, 1, n)
        else:
            return self.arithmeticSeriesSum(1, 1, k // 2) + self.arithmeticSeriesSum(k, 1, n - k // 2)

    def arithmeticSeriesSum(self, a1: int, d: int, n: int) -> int:
        return (a1 + a1 + (n - 1) * d) * n // 2

