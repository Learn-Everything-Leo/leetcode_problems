class Solution:
    def checkString(self, s: str) -> bool:
        hasB = False
        for c in s:
            if c == 'b':
                hasB = True
            elif c == 'a' and hasB:
                return False
        return True
                
                