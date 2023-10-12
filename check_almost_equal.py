class Solution:
    def checkAlmostEquivalent(self, word1: str, word2: str) -> bool:
        freq = defaultdict(int)
        for c in word1:
            freq[c] += 1
        for c in word2:
            freq[c] -= 1
        return all(abs(x) <= 3 for x in freq.values()) 