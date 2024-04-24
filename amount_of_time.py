# Definition for a binary tree node.
from collections import defaultdict, deque


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution:
    def amountOfTime(self, root: Optional[TreeNode], start: int) -> int:
        graph = defaultdict(list)
        def dfs(node: TreeNode) -> None:
            for child in [node.left, node.right]:
                if child:
                    graph[node.val].append(child.val)
                    graph[child.val].append(node.val)
                    dfs(child)
        dfs(root)

        q = deque([[start, 0]])
        visited = set([start])
        time = 0
        while q:
            nodeVal, time = q.popleft()
            for childVal in graph[nodeVal]:
                if childVal not in visited:
                    q.append([childVal, time + 1])
                    visited.add(childVal)
        return time