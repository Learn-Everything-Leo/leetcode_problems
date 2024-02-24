# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def closestNodes(self, root: Optional[TreeNode], queries: List[int]) -> List[List[int]]:
        arr = []
        def dfs(root):
            if root is None:
                return
            dfs(root.left)
            arr.append(root.val)
            dfs(root.right)
        
        dfs(root)
        res = []
        for val in  queries:
            maxVal, minVal = -1, -1
            index = bisect_left(arr, val)
            if index != len(arr):
                maxVal = arr[index]
                if arr[index] == val:
                    minVal = arr[index]
                    res.append([minVal, maxVal])
                    continue
            if index != 0:
                minVal = arr[index - 1]
            res.append([minVal, maxVal])
        return res