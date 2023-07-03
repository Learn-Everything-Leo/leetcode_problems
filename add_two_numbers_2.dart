class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    return reverseListNode(add(reverseListNode(l1), reverseListNode(l2), 0));
  }

  ListNode? reverseListNode(ListNode? node) {
    if (node == null || node.next == null) {
      return node;
    }
    ListNode? pre = null, current = node, next = current.next;
    while (current != null) {
      current.next = pre;
      pre = current;
      current = next;
      next = current?.next;
    }
    return pre;
  }

  ListNode? add(ListNode? l1, ListNode? l2, int carryOver) {
    if (l1 == null && l2 == null) {
      return carryOver > 0 ? ListNode(carryOver, null) : null;
    }
    if (l1 == null) {
      int value = carryOver + l2!.val;
      if (value >= 10) {
        return ListNode(value % 10, add(null, l2.next, 1));
      } else {
        return ListNode(value % 10, l2.next);
      }
    }
    if (l2 == null) {
      int value = carryOver + l1.val;
      if (value >= 10) {
        return ListNode(value % 10, add(l1.next, null, 1));
      } else {
        return ListNode(value % 10, l1.next);
      }
    }
    int value = carryOver + l1.val + l2.val;
    return ListNode(value % 10, add(l1.next, l2.next, value ~/ 10));
  }
}
