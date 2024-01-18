from ast import List


class Solution:
    def minimumRemoval(self, beans: List[int]) -> int:
        n = len(beans)
        beans.sort()
        total = sum(beans) # 豆子总数
        res = total # 最少需要移除的豆子数
        for i in range(n):
            res = min(res, total - beans[i] * (n - i))
        return res