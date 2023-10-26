class Solution:
    def countDigits(self, num: int) -> int:
        ans = 0
        origin = num
        while num > 0:
            ans += (origin % (num % 10) == 0)
            num //= 10
        return ans