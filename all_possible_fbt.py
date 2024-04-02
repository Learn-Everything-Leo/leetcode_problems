# Definition for a binary tree node.
from ast import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def allPossibleFBT(self, n: int) -> List[Optional[TreeNode]]:
        full_binary_trees = []
        if n % 2 == 0:
            return full_binary_trees
        if n == 1:
            full_binary_trees.append(TreeNode(0))
            return full_binary_trees
        for i in range(1, n, 2):
            left_subtrees = self.allPossibleFBT(i)
            right_subtrees = self.allPossibleFBT(n - 1 - i)
            for left_subtree in left_subtrees:
                for right_subtree in right_subtrees:
                    root = TreeNode(0, left_subtree, right_subtree)
                    full_binary_trees.append(root)
        return full_binary_trees
