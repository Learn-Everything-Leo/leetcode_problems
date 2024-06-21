from ast import List


class Solution:
    def temperatureTrend(self, temperatureA: List[int], temperatureB: List[int]) -> int:
        ans = 0
        current = 0
        for i in range(0, len(temperatureA) - 1):
            if (temperatureA[i + 1] - temperatureA[i]) * (temperatureB[i + 1] - temperatureB[i]) > 0:
                current += 1
            elif (temperatureA[i + 1] - temperatureA[i]) == 0 and (temperatureB[i + 1] - temperatureB[i]) == 0:
                current += 1
            else:
                ans = max(ans, current)
                current = 0
        return max(ans, current)