# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def kthLargestLevelSum(self, root: Optional[TreeNode], k: int) -> int:
        q = [root]
        levelSumArray = []
        while q:
            levelNodes = q
            levelSum = 0
            q = []
            for node in levelNodes:
                levelSum += node.val
                if node.left: 
                    q.append(node.left)
                if node.right: 
                    q.append(node.right)
            levelSumArray.append(levelSum)
        if len(levelSumArray) < k:
            return -1
        levelSumArray.sort()
        return levelSumArray[-k]
