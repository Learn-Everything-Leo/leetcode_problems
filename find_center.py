from ast import List


class Solution:
    def findCenter(self, edges: List[List[int]]) -> int:
        n = len(edges) + 1
        degrees = [0] * (n + 1)
        for x, y in edges:
            degrees[x] += 1
            degrees[y] += 1
        for i, d in enumerate(degrees):
            if d == n - 1:
                return i