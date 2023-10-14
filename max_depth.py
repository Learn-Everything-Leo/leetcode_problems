class Solution:
    def maxDepth(self, s: str) -> int:
        res, size = 0, 0
        for c in s:
            if c == '(':
                size += 1
                res = max(res, size)
            elif c == ')':
                size -= 1
        return res