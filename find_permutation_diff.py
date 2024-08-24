class Solution:
    def findPermutationDifference(self, s: str, t: str) -> int:
        pos = {c: i for i, c in enumerate(s)}
        return sum(abs(i - pos[c]) for i, c in enumerate(t))