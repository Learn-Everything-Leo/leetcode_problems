from ast import List
from collections import deque


class Solution:
    def minSwapsCouples(self, row: List[int]) -> int:
        n = len(row)
        tot = n // 2

        graph = [[] for _ in range(tot)]
        for i in range(0, n, 2):
            l = row[i] // 2
            r = row[i + 1] // 2
            if l != r:
                graph[l].append(r)
                graph[r].append(l)

        visited = [0] * tot
        ret = 0

        for i in range(tot):
            if visited[i] == 0:
                q = deque()
                visited[i] = 1
                q.append(i)
                cnt = 0
                while q:
                    x = q.popleft()
                    cnt += 1
                    for y in graph[x]:
                        if visited[y] == 0:
                            visited[y] = 1
                            q.append(y)
                ret += cnt - 1
        return ret