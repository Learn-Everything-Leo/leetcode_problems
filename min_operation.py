from ast import List


class Solution:
    def minOperations(self, nums: List[int]) -> int:
        n = len(nums)
        sortedUniqueNums = sorted((set(nums)))
        res = n
        j = 0
        for i, left in enumerate(sortedUniqueNums):
            right = left + n - 1
            while j < len(sortedUniqueNums) and sortedUniqueNums[j] <= right:
                res = min(res, n - (j - i + 1))
                j += 1
        return res
