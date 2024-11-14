from typing import List


class Solution:
    def countGoodNodes(self, edges: List[List[int]]) -> int:
        n = len(edges) + 1
        g = [[] for _ in range(n)]
        for x, y in edges:
            g[x].append(y)
            g[y].append(x)

        self.res = 0

        def dfs(node: int, parent: int) -> int:
            valid = True
            treeSize = 0
            subTreeSize = 0
            for child in g[node]:
                if child != parent:
                    size = dfs(child, node)
                    if subTreeSize == 0:
                        subTreeSize = size
                    elif size != subTreeSize:
                        valid = False
                    treeSize += size
            if valid:
                self.res += 1
            return treeSize + 1

        dfs(0, -1)
        return self.res
