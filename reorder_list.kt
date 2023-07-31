class ListNode(value: Int) {
    var next: ListNode? = null
}

class Solution {
    // 方法一用线性表来实现, 但是占用额外内存
    fun reorderList(head: ListNode?): Unit {
        var mid: ListNode? = findMid(head)
        var foot: ListNode? = reverseList(mid?.next)
        mid?.next = null
        combine(head, foot)
    }

   fun findMid(head: ListNode?): ListNode? {
        var slow = head
        var fast = head
        while (true) {
            if (fast?.next == null || fast?.next?.next == null) {
                break
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    fun reverseList(node: ListNode?): ListNode? {
        if (node == null || node?.next == null) {
            return node
        }

        var pre: ListNode? = null 
        var cur = node
        var next: ListNode? = null
        while (cur != null) {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

    fun combine(nodeA: ListNode?, nodeB: ListNode?): Unit {
        val head = ListNode(0)
        var cur: ListNode? = head
        var nodeACopy = nodeA
        var nodeBCopy = nodeB
        while (nodeACopy != null) {
            cur?.next = nodeACopy
            nodeACopy = nodeACopy?.next
            cur = cur?.next

            cur?.next = nodeBCopy
            nodeBCopy = nodeBCopy?.next
            cur = cur?.next
        }
        cur?.next = null
    }

}