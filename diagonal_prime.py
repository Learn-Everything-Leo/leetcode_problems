from typing import List


class Solution:
    def isPrime(self, num: int) -> bool:
        if num < 2:
            return False
        for i in range(2, int(num ** 0.5) + 1):
            if num % i == 0:
                return False
        return True
    
    def diagonalPrime(self, nums: List[List[int]]) -> int:
        n = len(nums)
        max_prime = 0
        for i in range(n):
            if nums[i][i] > max_prime and self.isPrime(nums[i][i]):
                max_prime = nums[i][i]
            if nums[i][n - 1 - i] > max_prime and self.isPrime(nums[i][n - 1 - i]):
                max_prime = nums[i][n - 1 - i]
        return max_prime