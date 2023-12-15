class Solution:
    def reverseOddLevels(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        def dfs(root1: Optional[TreeNode], root2 : Optional[TreeNode], isOdd : bool) -> None:
            if root1 is None:
                return
            if isOdd:
                root1.val, root2.val = root2.val, root1.val
            dfs(root1.left, root2.right, not isOdd)
            dfs(root1.right, root2.left, not isOdd)
        dfs(root.left, root.right, True)
        return root