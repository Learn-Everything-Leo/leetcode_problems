class Solution:
    def getSmallestString(self, s: str, k: int) -> str:
        def distance(x, y):
            dis = abs(ord(x) - ord(y))
            return min(dis, 26 - dis)
        
        a = 'a'
        n = len(s)
        res = []
        for i in range(n):
            if k == 0:
                res.append(s[i:])
                break
            for j in range(26):
                if (distance(s[i], chr(ord(a) + j)) <= k):
                    res.append(chr(ord(a) + j))
                    k -= distance(s[i], chr(ord(a) + j))
                    break
        return ''.join(res)
        