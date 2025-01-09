class Solution:
    def validSubstringCount(self, word1: str, word2: str) -> int:
        diff = [0] * 26
        for c in word2:
            diff[ord(c) - ord('a')] -= 1

        res = 0
        cnt = sum(1 for c in diff if c < 0)

        def update(c: int, add: int):
            nonlocal cnt
            diff[c] += add
            if add == 1 and diff[c] == 0:
                # 表明 diff[c] 由 -1 变为 0
                cnt -= 1
            elif add == -1 and diff[c] == -1:
                # 表明 diff[c] 由 0 变为 -1
                cnt += 1

        l, r = 0, 0
        while l < len(word1):
            while r < len(word1) and cnt > 0:
                update(ord(word1[r]) - ord('a'), 1)
                r += 1
            if cnt == 0:
                res += len(word1) - r + 1
            update(ord(word1[l]) - ord('a'), -1)
            l += 1

        return res