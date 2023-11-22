# Definition for singly-linked list.
from pyparsing import Optional


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
        a, b = headA, headB
        if (a is None) or (b is None):
            return None
        while a != b:
            a = a.next if a else headB
            b = b.next if b else headA
        return a