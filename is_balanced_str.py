class Solution:
    def isBalanced(self, num: str) -> bool:
        diff = 0
        sign = 1
        for c in num:
            d = int(c)
            diff += d * sign
            sign = -sign
        return diff == 0
