import java.util.ArrayList;
import java.util.List;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode() {}
    TreeNode(int val) { this.val = val; }
    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

class Solution {
  boolean isInToDelete(int[] toDelete, int val) {
    boolean isDelete = false;
    for (int num : toDelete) {
      if (val == num) {
        isDelete = true;
        break;
      }
    }
    return isDelete;
  }

  boolean dfs(TreeNode node, int[] toDelete, List<TreeNode> res) {
    if (node == null) {
      return true;
    }
    boolean left = dfs(node.left, toDelete, res);
    boolean right = dfs(node.right, toDelete, res);
    boolean isDelete = isInToDelete(toDelete, node.val);
    if (isDelete) {
      if (!left) {
        res.add(node.left);
      }
      if (!right) {
        res.add(node.right);
      }
      node.left = null;
      node.right = null;
    }
    if (left) {
      node.left = null;
    }
    if (right) {
      node.right = null;
    }

    return isDelete;
  }

  public List<TreeNode> delNodes(TreeNode root, int[] toDelete) {
    List<TreeNode> res = new ArrayList<>();
    if (root == null) {
      return res;
    }
    if (!isInToDelete(toDelete, root.val)) {
      res.add(root);
    }
    dfs(root, toDelete, res);
    return res;
  }
}