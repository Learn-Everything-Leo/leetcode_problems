from ast import List


class Solution:
    def findOriginalArray(self, changed: List[int]) -> List[int]:
        changed.sort()
        count = Counter(changed)
        res = []
        for a in changed:
            if count[a] == 0:
                continue
            count[a] -= 1
            if count[a * 2] == 0:
                return []
            count[a * 2] -= 1
            res.append(a)
        return res
