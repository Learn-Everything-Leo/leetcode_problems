class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) {
      return head;
    }

    ListNode? next = head.next;
    ListNode? nextHead = head.next?.next;
    next?.next = head;
    head.next = swapPairs(nextHead);
    return next;
  }
}
