class Solution:
    def balancedStringSplit(self, s: str) -> int:
        ans = 0
        lc, rc = 0, 0
        for c in s:
            if c == 'L':
                lc += 1
            else:
                rc += 1
            if lc == rc:
                ans += 1
                lc, rc = 0, 0
        return ans