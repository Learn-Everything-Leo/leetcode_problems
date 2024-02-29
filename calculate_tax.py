from ast import List


class Solution:
    def calculateTax(self, brackets: List[List[int]], income: int) -> float:
        totalTax = lower = 0
        for upper, percent in brackets:
            tax = (min(income, upper) - lower) * percent
            totalTax += tax
            if income <= upper:
                break
            lower = upper
        return totalTax / 100