class ListNode(value: Int) {
    var next: ListNode? = null
}

class Solution {
    fun detectCycle(head: ListNode?): ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while (true) {
            if (fast == null || fast.next == null) {
                return null;
            }
            slow = slow?.next
            fast = fast?.next?.next
            if (fast == slow) {
                break
            }
        }
        fast = head
        while (slow != fast) {
            slow = slow?.next
            fast = fast?.next
        }
        return fast
    }
}