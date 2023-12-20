class Solution:
    def isAcronym(self, words: List[str], s: str) -> bool:
        res = []
        for word in words:
            res.append(word[0])
        return ''.join(res) == s