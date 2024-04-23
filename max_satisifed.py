from ast import List


class Solution:
    def maxSatisfied(self, customers: List[int], grumpy: List[int], minutes: int) -> int:
        n = len(customers)
        total = sum(c for c, g in zip(customers, grumpy) if g == 0)
        maxIncrease = increase = sum(c * g for c, g in zip(customers[:minutes], grumpy[:minutes]))
        for i in range(minutes, n):
            increase += customers[i] * grumpy[i] - customers[i - minutes] * grumpy[i - minutes]
            maxIncrease = max(maxIncrease, increase)
        return total + maxIncrease