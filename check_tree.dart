class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool checkTree(TreeNode? root) {
    if (root != null && root.left != null && root.right != null) {
      return root.val == root.left!.val + root.right!.val;
    }
    return false;
  }
}
