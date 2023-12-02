from ast import List


class Solution:
    def carPooling(self, trips: List[List[int]], capacity: int) -> bool:
        mp = {}
        for trip in trips:
            if trip[1] not in mp:
                mp[trip[1]] = 0
            if trip[2] not in mp:
                mp[trip[2]] = 0
            mp[trip[1]] += trip[0]
            mp[trip[2]] -= trip[0]
        cur = 0
        for k in sorted(mp.keys()):
            cur += mp[k]
            if cur > capacity:
                return False
        return True
        
        