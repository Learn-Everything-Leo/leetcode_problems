# Definition for a Node.
from collections import deque
from altair import List


class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children


class Solution:
    def levelOrder(self, root: 'Node') -> List[List[int]]:
        if not root:
            return []

        ans = list()
        q = deque([root])

        while q:
            cnt = len(q)
            level = list()
            for _ in range(cnt):
                cur = q.popleft()
                level.append(cur.val)
                for child in cur.children:
                    q.append(child)
            ans.append(level)

        return ans
