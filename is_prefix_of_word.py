class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        words = sentence.split(' ')
        res = -1
        for word in words:
            if word.startswith(searchWord):
                res = words.index(word) + 1
                break
        return res