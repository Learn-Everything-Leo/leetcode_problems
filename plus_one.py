from ast import List


class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        digits.reverse()
        n = len(digits)
        digits[0] += 1
        for i in range(n):
            if digits[i] >= 10:
                digits[i] = digits[i] % 10
                if (i != n-1):
                    digits[i+1] += 1
                else:
                    digits.append(1)
            else:
                break
        digits.reverse()
        return digits