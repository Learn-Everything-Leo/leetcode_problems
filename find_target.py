# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def findTarget(self, root: Optional[TreeNode], k: int) -> bool:
        arr = []
        def dfs(treeNode: TreeNode):
            if treeNode is None:
                return
            dfs(treeNode.left)
            arr.append(treeNode.val)
            dfs(treeNode.right)
        dfs(root)
        l, r = 0, len(arr) - 1
        while l < r:
            if arr[l] + arr[r] == k:
                return True
            if arr[l] + arr[r] < k:
                l += 1
            else:
                r -= 1
        return False