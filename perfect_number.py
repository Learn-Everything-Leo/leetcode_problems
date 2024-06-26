import math

class Solution:
    def checkPerfectNumber(self, num: int) -> bool:
        if num == 1:
            return False
        res = 0
        for i in range(1, int(math.sqrt(num)) + 1):
            if num % i == 0:
                res += i
                if i != num // i and i != 1:
                    res += num // i
        return res == num