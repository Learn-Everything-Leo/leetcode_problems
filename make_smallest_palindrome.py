class Solution:
    def makeSmallestPalindrome(self, s: str) -> str:
        n = len(s)
        s = list(s)
        for i in range(n):
            if s[i] != s[n - i - 1]:
                s[i] = s[i] if s[i] < s[n - i - 1] else s[n - i - 1]
        return "".join(s)
        