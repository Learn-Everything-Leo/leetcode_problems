from ast import List


class Solution:
    def splitWordsBySeparator(self, words: List[str], separator: str) -> List[str]:
        res = []
        for word in words:
            res += [sub for sub in word.split(separator) if len(sub)]
        return res