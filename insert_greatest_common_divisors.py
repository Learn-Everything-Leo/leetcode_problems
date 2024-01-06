import math
from pyparsing import Optional

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def insertGreatestCommonDivisors(self, head: Optional[ListNode]) -> Optional[ListNode]:
        node = head
        while node.next is not None:
            node.next = ListNode(math.gcd(node.val, node.next.val), node.next)
            node = node.next.next
        return head