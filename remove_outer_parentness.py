class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        res = ''
        stack = []
        for c in s:
            if c == '(':
                stack.append(c)
                if len(stack) > 1:
                    res += c
            else:
                stack.pop()
                if len(stack) > 0:
                    res += c
        return res
            