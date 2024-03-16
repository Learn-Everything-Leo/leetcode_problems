from ast import List


class Solution:
    def sumOfUnique(self, nums: List[int]) -> int:
        res = 0
        map = {}
        for num in nums:
            if num in map:
                map[num] += 1
            else:
                map[num] = 1
        for key in map:
            if map[key] == 1:
                res += key
        return res
        