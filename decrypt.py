from ast import List


class Solution:
    def decrypt(self, code: List[int], k: int) -> List[int]:
        n = len(code)
        res = [0] * n
        if k > 0:
            for i in range(n):
                for j in range(1, k+1):
                    res[i] += code[(i+j)%n]
        elif k < 0:
            for i in range(n):
                for j in range(-1, k-1, -1):
                    res[i] += code[(i+j)%n]
        return res
