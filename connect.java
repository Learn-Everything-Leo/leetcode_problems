import java.util.LinkedList;

// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node next;

    public Node() {}
    
    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _left, Node _right, Node _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};

class Solution {
    public Boolean isTwoPow(int n) {
        int count = 0;
        while (n > 0) {
            count += n & 1;
            n >>= 1;
        }
        return count == 1;
    }

    public Node connect(Node root) {
        if (root == null) {
            return null;
        }
        LinkedList<Node> queue = new LinkedList<Node>();
        queue.addLast(root);
        Node preNode = null;
        int index = 0;
        while (!queue.isEmpty()) {
            Node node = queue.removeFirst();
            if (node.left != null) {
                queue.addLast(node.left);
                queue.addLast(node.right);
            }
            index++;

            if (preNode != null) {
                preNode.next = node;
                if (isTwoPow(index)) {
                    preNode.next = null;
                }
            }
            preNode = node;
        }
        return root;
    }
}