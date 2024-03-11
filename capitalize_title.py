class Solution:
    def capitalizeTitle(self, title: str) -> str:
        res = []
        for word in title.split():
            if len(word) <= 2:
                res.append(word.lower())
            else:
                res.append(word[0].upper() + word[1:].lower())
        return ' '.join(res)