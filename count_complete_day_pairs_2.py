from ast import List


class Solution:
    def countCompleteDayPairs(self, hours: List[int]) -> int:
        res = 0
        modList = [0] * 24
        for hour in hours:
            modList[hour % 24] += 1
        for i in range(1, 12):
            res += modList[i] * modList[24 - i]
        res += (modList[0] * (modList[0] - 1)) // 2
        res += (modList[12] * (modList[12] - 1)) // 2
        return res