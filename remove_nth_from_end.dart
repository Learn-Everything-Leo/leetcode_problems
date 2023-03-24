/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    int length = 0;
    ListNode? p = head;
    while (p != null) {
      p = p.next;
      length++;
    }
    if (n == length) {
      return head?.next;
    }
    ListNode? pre = ListNode(0, head);
    int step = length - n;
    while (step > 0) {
      pre = pre?.next;
      step--;
    }
    if (pre?.next != null) {
      pre?.next = pre.next?.next;
    }
    return head;
  }
}
