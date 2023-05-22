class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? sufficientSubset(TreeNode? root, int limit) {
    bool sufficient = checkSufficient(root, 0, limit);
    return sufficient ? root : null;
  }

  bool checkSufficient(TreeNode? node, int sum, int limit) {
    if (node == null) {
      return false;
    }
    if (node.left == null && node.right == null) {
      return sum + node.val >= limit;
    }
    bool leftNodeSufficient = checkSufficient(node.left, sum + node.val, limit);
    bool rightNodeSufficient =
        checkSufficient(node.right, sum + node.val, limit);
    if (!leftNodeSufficient) {
      node.left = null;
    }
    if (!rightNodeSufficient) {
      node.right = null;
    }
    return leftNodeSufficient || rightNodeSufficient;
  }
}
