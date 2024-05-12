from ast import List


class Solution:
    def countTestedDevices(self, batteryPercentages: List[int]) -> int:
        res = 0
        for i in range(len(batteryPercentages)):
            if batteryPercentages[i] > res:
                res += 1
        return res