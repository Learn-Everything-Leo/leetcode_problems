from ast import List
from collections import Counter


class Solution:
    def minimumRounds(self, tasks: List[int]) -> int:
        cnt = Counter(tasks)
        res = 0
        for v in cnt.values():
            if v == 1:
                return -1
            if v % 3 == 0:
                res += v // 3
            else:
                res += (1 + v // 3)
        return res
