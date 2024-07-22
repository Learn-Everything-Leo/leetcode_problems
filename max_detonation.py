from ast import List
from collections import defaultdict, deque


class Solution:
    def maximumDetonation(self, bombs: List[List[int]]) -> int:
        n = len(bombs)
        def canBomb(i, j):
            x1, y1, r1 = bombs[i]
            x2, y2, r2 = bombs[j]
            return (x1 - x2) ** 2 + (y1 - y2) ** 2 <= r1** 2
        
        edges = defaultdict(list)
        for i in range(n):
            for j in range(n):
                if i != j and canBomb(i, j):
                    edges[i].append(j)
                    
        res = 0
        for i in range(n):
            visited = [False] * n
            q = deque([i])
            cnt = 1
            visited[i] = True
            while q:
                x = q.popleft()
                for y in edges[x]:
                    if visited[y]:
                        continue
                    visited[y] = True
                    q.append(y)
                    cnt += 1
            res = max(res, cnt)
        return res