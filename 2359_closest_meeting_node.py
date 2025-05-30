#
# @lc app=leetcode.cn id=2359 lang=python3
#
# [2359] 找到离给定两个节点最近的节点
#

# @lc code=start
class Solution:
    def closestMeetingNode(self, edges: List[int], node1: int, node2: int) -> int:
        n = len(edges)
        def get(x):
            d = [-1] * n
            p = x
            dis = 0
            while p != -1 and d[p] == -1:
                d[p] = dis
                p = edges[p]
                dis += 1
            return d
        d1 = get(node1)
        d2 = get(node2)
        res = -1
        for i in range(n):
            if d1[i] != -1 and d2[i] != -1:
                if res == -1 or max(d1[i], d2[i]) < max(d1[res], d2[res]):
                    res = i
        return res


# @lc code=end

