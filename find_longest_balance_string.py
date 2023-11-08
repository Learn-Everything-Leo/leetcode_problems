class Solution:
    def findTheLongestBalancedSubstring(self, s: str) -> int:
        ans = 0
        maxZero = 0
        maxOne = 0
        for c in range(len(s)):
            if s[c] == '0':
                if maxZero != 0 and maxOne != 0 :
                    ans = max(ans, min(maxZero, maxOne) * 2)
                    maxOne = 0
                    maxZero = 0
                maxZero += 1
            else:
                if (maxZero != 0):
                    maxOne += 1
        ans = max(ans, min(maxZero, maxOne) * 2)
        return ans