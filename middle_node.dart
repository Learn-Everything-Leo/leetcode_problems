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
  ListNode? middleNode(ListNode? head) {
    ListNode? p1 = head;
    ListNode? p2 = head;
    while (p2 != null) {
      p2 = p2.next;
      if (p2 != null) {
        p2 = p2.next;
        p1 = p1?.next;
      }
    }
    return p1;
  }
}
