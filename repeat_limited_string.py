class Solution:
    def repeatLimitedString(self, s: str, repeatLimit: int) -> str:
        N = 26
        count = [0] * N
        for c in s:
            count[ord(c) - ord('a')] += 1
        res = [] 
        i, j, m = N - 1, N - 2, 0
        while i >= 0 and j >= 0:
            if count[i] == 0:
                m, i = 0, i - 1
            elif m < repeatLimit:
                count[i] -= 1
                res.append(chr(ord('a') + i))
                m += 1
            elif j >= i or count[j] == 0:
                j -= 1
            else:
                count[j] -= 1
                res.append(chr(ord('a') + j))
                m = 0
        return ''.join(res)