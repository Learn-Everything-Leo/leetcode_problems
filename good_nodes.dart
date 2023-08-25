import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int count = 0;

  int goodNodes(TreeNode? root) {
    return goodNodesImp(root, -10001);
  }

  int goodNodesImp(TreeNode? root, int lastMax) {
    if (root == null) {
      return 0;
    }
    count += isGoodNode(root, lastMax);
    int maxValue = max(lastMax, root.val);
    goodNodesImp(root.left, maxValue);
    goodNodesImp(root.right, maxValue);
    return count;
  }

  int isGoodNode(TreeNode node, int currentMax) {
    return node.val >= currentMax ? 1 : 0;
  }
}
