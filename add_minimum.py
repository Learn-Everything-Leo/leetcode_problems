class Solution:
    def addMinimum(self, word: str) -> int:
        n, cnt = len(word), 1
        for i in range(1, n):
            if word[i] <= word[i - 1]:
                cnt += 1
        return cnt * 3 - n
