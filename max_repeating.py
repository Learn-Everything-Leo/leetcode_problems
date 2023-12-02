class Solution:
    def maxRepeating(self, sequence: str, word: str) -> int:
        n = len(sequence)
        m = len(word)
        ans = 0
        for i in range(n):
            j = 0
            while i + j < n and sequence[i + j] == word[j % m]:
                j += 1
            ans = max(ans, j // m)
        return ans