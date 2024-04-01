from collections import deque


class Solution:
    def finalString(self, s: str) -> str:
        q = deque()
        head = False
        for ch in s:
            if ch != "i":
                if head:
                    q.appendleft(ch)
                else:
                    q.append(ch)
            else:
                head = not head
        ans = "".join(q)
        if head:
            ans = ans[::-1]
        return ans
