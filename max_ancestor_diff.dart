import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxAncestorDiff(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    int rootValue = root.val;
    int res = 0;
    List<TreeNode?> queue = [root.left, root.right];
    while (queue.isNotEmpty) {
      TreeNode? front = queue.removeAt(0);
      if (front != null) {
        res = max(res, (front.val - rootValue).abs());
        if (front.left != null) {
          queue.add(front.left);
        }
        if (front.right != null) {
          queue.add(front.right);
        }
      }
    }
    res = max(res, maxAncestorDiff(root.left));
    res = max(res, maxAncestorDiff(root.right));
    return res;
  }

  int maxDiff(TreeNode? node, int maxVal, int minVal) {
    if (node == null) {
      return 0;
    }
    int res = max((node.val - maxVal).abs(), (node.val - minVal).abs());
    minVal = min(minVal, node.val);
    maxVal = max(maxVal, node.val);
    res = max(res, maxDiff(node.left, maxVal, minVal));
    res = max(res, maxDiff(node.right, maxVal, minVal));
    return res;
  }

  int maxAncestorDiff2(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    return maxDiff(root, root.val, root.val);
  }
}
