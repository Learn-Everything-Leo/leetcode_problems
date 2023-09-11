class Solution:
    def __init__(self):
        self.edges = []
        self.visited = []
        self.result = []
        self.valid = True
    
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        self.edges = [[] for _ in range(numCourses)]
        self.visited = [0 for _ in range(numCourses)]
        self.result = []
        self.valid = True

        for info in prerequisites:
            self.edges[info[1]].append(info[0])

        for i in range(numCourses):
            if self.valid:
                if self.visited[i] == 0:
                    self.dfs(i)
            else:
                break

        return self.valid == True and self.result or []

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
        self.result.insert(0, u)