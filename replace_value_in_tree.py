# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def replaceValueInTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        q = [root]
        root.val = 0
        while len(q) > 0:
            q2 = []
            sum = 0
            for fa in q:
                if fa.left:
                    q2.append(fa.left)
                    sum += fa.left.val
                if fa.right:
                    q2.append(fa.right)
                    sum += fa.right.val
            for fa in q:
                childSum = (fa.left.val if fa.left else 0) + (fa.right.val if fa.right else 0)
                if fa.left:
                    fa.left.val = sum - childSum
                if fa.right:
                    fa.right.val = sum - childSum
            q = q2
        return root
