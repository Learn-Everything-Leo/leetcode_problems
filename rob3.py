# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class SubtreeStatus:
    def __init__(self, selected, notSelected):
        self.selected = selected
        self.notSelected = notSelected
        
class Solution:
    def dfs(self, root):
        if not root:
            return SubtreeStatus(0, 0)
        left = self.dfs(root.left)
        right = self.dfs(root.right)
        selected = root.val + left.notSelected + right.notSelected
        notSelected = max(left.selected, left.notSelected) + max(right.selected, right.notSelected)
        return SubtreeStatus(selected, notSelected)

    def rob(self, root: Optional[TreeNode]) -> int:
        rootStatus = self.dfs(root)
        return max(rootStatus.selected, rootStatus.notSelected)
