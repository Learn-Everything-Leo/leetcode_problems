class Solution:
    def countKeyChanges(self, s: str) -> int:
        lowerStr = s.lower()
        return sum(lowerStr[i] != lowerStr[i + 1] for i in range(len(lowerStr) - 1))