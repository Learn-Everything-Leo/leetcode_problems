from ast import List
from cmath import inf
from heapq import heappop, heappush


class Solution:
    def countPaths(self, n: int, roads: List[List[int]]) -> int:
        mod = 10 ** 9 + 7
        e = [[] for _ in range(n)]
        for x, y, t in roads:
            e[x].append([y, t])
            e[y].append([x, t])
        dis = [0] + [inf] * (n - 1)
        ways = [1] + [0] * (n - 1)

        q = [[0, 0]]
        while q:
            t, u = heappop(q)
            if t > dis[u]:
                continue
            for v, w in e[u]:
                if t + w < dis[v]:
                    dis[v] = t + w
                    ways[v] = ways[u]
                    heappush(q, [t + w, v])
                elif t + w == dis[v]:
                    ways[v] = (ways[u] + ways[v]) % mod
        return ways[-1]