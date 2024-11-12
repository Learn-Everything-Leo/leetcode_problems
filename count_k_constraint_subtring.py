class Solution:
    def countKConstraintSubstrings(self, s: str, k: int) -> int:
        ans = left = 0
        cnt = [0, 0]
        for i, c in enumerate(s):
            cnt[ord(c) & 1] += 1
            while cnt[0] > k and cnt[1] > k:
                cnt[ord(s[left]) & 1] -= 1
                left += 1
            ans += i - left + 1
        return ans