class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        counter = [0] * 10
        return self.dfs(root, counter)

    def dfs(self, root: Optional[TreeNode], counter: list[int]) -> int:
        if not root:
            return 0
        counter[root.val] += 1
        res = 0
        if not root.left and not root.right:
            if self.isPseudoPalindrome(counter):
                res = 1
        else:
            res = self.dfs(root.left, counter) + self.dfs(root.right, counter)
        counter[root.val] -= 1
        return res

    def isPseudoPalindrome(self, counter: list[int]) -> bool:
        odd = 0
        for value in counter:
            if value % 2 == 1:
                odd += 1
        return odd <= 1