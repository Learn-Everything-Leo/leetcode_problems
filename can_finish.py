class Solution:
    def __init__(self):
        self.edges = []
        self.visited = []
        self.valid = True

    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        self.edges = [[] for _ in range(numCourses)]
        self.visited = [0 for _ in range(numCourses)]

        for info in prerequisites:
            self.edges[info[1]].append(info[0])

        for i in range(numCourses):
            if self.valid:
                if self.visited[i] == 0:
                    self.dfs(i)
            else:
                break

        return self.valid
    
    def dfs(self, u):
        self.visited[u] = 1
        for v in self.edges[u]:
            if self.visited[v] == 0:
                self.dfs(v)
                if not self.valid:
                    return
            elif self.visited[v] == 1:
                self.valid = False
                return
        self.visited[u] = 2
