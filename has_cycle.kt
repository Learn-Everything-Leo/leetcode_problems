class ListNode(value: Int) {
    var next: ListNode? = null
}

class Solution {
    fun hasCycle(head: ListNode?): Boolean {
        var count: Int = 0
        var node = head
        while (node != null) {
            node = node.next
            count++
            if (count > 10000) {
                return true
            }
        }
        return false
    }
}