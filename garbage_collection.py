from ast import List


class Solution:
    def garbageCollection(self, garbage: List[str], travel: List[int]) -> int:
        distance = {}
        res = 0
        cur_dis = 0
        for i in range(len(garbage)):
            res += len(garbage[i])
            if i > 0:
                cur_dis += travel[i - 1]
            for c in garbage[i]:
                distance[c] = cur_dis
        return res + sum(distance.values())
