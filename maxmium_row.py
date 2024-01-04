from ast import List


def count_trailing_zeros(x):
    return (x & -x).bit_length() - 1

class Solution:
    def maximumRows(self, matrix: List[List[int]], numSelect: int) -> int:
        m, n = len(matrix), len(matrix[0])
        mask = [sum(v << j for j, v in enumerate(row)) for i, row in enumerate(matrix)]
        res, cur = 0, (1 << numSelect) - 1
        limit = 1 << n
        while cur < limit:
            t = sum((mask[j] & cur) == mask[j] for j in range(m))
            res = max(res, t)
            lb = cur & -cur
            r = cur + lb
            cur = ((r ^ cur) >> count_trailing_zeros(lb) + 2) | r
        return res