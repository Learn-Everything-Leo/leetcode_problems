class Solution:
    def sumRootToLeaf(self, root: Optional[TreeNode]) -> int:
        ans = val = 0
        st = []
        pre = None
        while root or st:
            while root:
                val = (val << 1) | root.val
                st.append(root)
                root = root.left
            root = st[-1]
            if root.right is None or root.right == pre:
                if root.left is None and root.right is None:
                    ans += val
                val >>= 1
                st.pop()
                pre = root
                root = None
            else:
                root = root.right
        return ans