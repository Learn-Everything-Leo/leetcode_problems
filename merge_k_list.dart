import 'priority_queue.dart';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    PriorityQueue<ListNode> queue =
        PriorityQueue((a, b) => a.val.compareTo(b.val));
    for (int i = 0; i < lists.length; i++) {
      if (lists[i] != null) {
        queue.add(lists[i]!);
      }
    }
    ListNode head = ListNode();
    ListNode current = head;
    while (queue.isNotEmpty) {
      ListNode node = queue.removeFirst();
      if (node.next != null) {
        queue.add(node.next!);
      }
      current.next = node;
      current = current.next!;
    }
    return head.next;
  }
}
