from ast import List
from cmath import inf


class Solution:
    def findTheCity(self, n: int, edges: List[List[int]], distanceThreshold: int) -> int:
        ans = (inf, -1)
        mp = [[inf] * n for _ in range(n)]

        for fr, to, weight in edges:
            mp[fr][to], mp[to][fr] = weight, weight
        for k in range(n):
            mp[k][k] = 0
            for i in range(n):
                for j in range(n):
                    mp[i][j] = min(mp[i][j], mp[i][k] + mp[k][j])
        for i in range(n):
            cnt = sum(mp[i][j] <= distanceThreshold for j in range(n))
            if cnt <= ans[0]:
                ans = (cnt, i)
        return ans[1]