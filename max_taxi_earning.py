from ast import List


class Solution:
    def maxTaxiEarnings(self, n: int, rides: List[List[int]]) -> int:
        dp = [0] * (n + 1)
        rideMap = {}
        for ride in rides:
            if ride[1] not in rideMap:
                rideMap[ride[1]] = []
            rideMap[ride[1]].append(ride)
        for i in range(1, n + 1):
            dp[i] = dp[i - 1]
            if i not in rideMap:
                continue
            for ride in rideMap[i]:
                dp[i] = max(dp[i], dp[ride[0]] + ride[1] - ride[0] + ride[2])
        return dp[n]