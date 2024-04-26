from ast import List


class Solution:
    def findLucky(self, arr: List[int]) -> int:
        m = dict()
        for x in arr:
            m[x] = m.get(x, 0) + 1
        ans = -1
        for (key, value) in m.items():
            if key == value:
                ans = max(ans, key)
        return ans