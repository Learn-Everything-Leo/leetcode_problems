from ast import List
from cmath import inf


class Solution:
    def maximumMinutes(self, grid: List[List[int]]) -> int:
        def bfs():
            m, n = len(grid), len(grid[0])
            q = []
            for i in range(m):
                for j in range(n):
                    if grid[i][j] == 1:
                        q.append((i, j))
                        fireTime[i][j] = 0
            
            time = 1
            while len(q) > 0:
                tmp = q
                q = []
                for cx, cy in tmp:
                    for nx, ny in (cx, cy - 1), (cx, cy + 1), (cx - 1, cy), (cx + 1, cy):
                        if nx >= 0 and ny >= 0 and nx < m and ny < n:
                            if grid[nx][ny] == 2 or fireTime[nx][ny] != inf:
                                continue
                            q.append((nx, ny))
                            fireTime[nx][ny] = time
                time += 1

        def check(stayTime):
            print(stayTime)
            m, n = len(grid), len(grid[0])
            visit = set((0, 0))
            q = []
            q.append((0, 0, stayTime))
            while len(q) > 0:
                tmp = q
                q = []

                for cx, cy, time in tmp:
                    for nx, ny in (cx, cy - 1), (cx, cy + 1), (cx - 1, cy), (cx + 1, cy):
                        if nx >= 0 and ny >= 0 and nx < m and ny < n:
                            if (nx, ny) in visit or grid[nx][ny] == 2:
                                continue
                            # 到达安全屋
                            if nx == m - 1 and ny == n - 1:
                                return fireTime[nx][ny] >= time + 1
                            # 火未到达当前位置 
                            if fireTime[nx][ny] > time + 1:
                                q.append((nx, ny, time + 1))
                                visit.add((nx, ny))
            return False

        m, n = len(grid), len(grid[0])
        fireTime = [[inf] * n for _ in range(m)]
        # 通过 bfs 求出每个格子着火的时间
        bfs()
        # 二分查找找到最大停留时间
        ans = -1
        low, high = 0, m * n
        while low <= high:
            mid = low + (high - low) // 2
            if check(mid):
                ans = mid
                low = mid + 1
            else:
                high = mid - 1
        return ans if ans < m * n else 10**9