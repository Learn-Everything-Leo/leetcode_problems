from ast import List
from collections import Counter


class Solution:
    def bestHand(self, ranks: List[int], suits: List[str]) -> str:
        if len(set(suits)) == 1:
            return "Flush"
        h = Counter(ranks)
        if len(h) == 5:
            return "High Card"
        for [a, b] in h.items():
            if b > 2:
                return "Three of a Kind"
        return "Pair"