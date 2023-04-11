class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  List<int> nextLargerNodes(ListNode? head) {
    int length = 0;
    ListNode? node = head;
    while (node != null) {
      length++;
      node = node.next;
    }
    List<int> res = List.generate(length, (index) => 0);
    List<List<int>> stack = [];
    node = head;
    int index = 0;
    while (node != null) {
      while (stack.isNotEmpty && node.val > stack.last.last) {
        List<int> pair = stack.removeLast();
        res[pair.first] = node.val;
      }
      stack.add([index, node.val]);
      node = node.next;
      index++;
    }
    return res;
  }
}
