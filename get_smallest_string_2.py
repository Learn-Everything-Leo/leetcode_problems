class Solution:
    def getSmallestString(self, s: str) -> str:
        n = len(s)
        for i in range(0, n - 1):
            if s[i] > s[i + 1] and int(s[i]) % 2 == int(s[i + 1]) % 2:
                s = s[:i] + s[i + 1] + s[i] + s[i + 2:]
                break
        return s