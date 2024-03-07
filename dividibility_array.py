class Solution(object):
    def divisibilityArray(self, word, m):
        cur = 0
        res = []
        for c in word:
            cur = (cur * 10 + int(c)) % m
            res.append(1 if cur == 0 else 0)
        return res