class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int move = 0;

  int distributeCoins(TreeNode? root) {
    dfs(root);
    return move;
  }

  int dfs(TreeNode? node) {
    int moveLeft = 0, moveRight = 0;
    if (node == null) {
      return 0;
    }
    if (node.left != null) {
      moveLeft = dfs(node.left);
    }
    if (node.right != null) {
      moveRight = dfs(node.right);
    }
    move += moveLeft.abs() + moveRight.abs();
    return moveLeft + moveRight + node.val - 1;
  }
}
