class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        map = {}
        for i in range(len(s)):
            if (map.get(s[i]) == None):
                if t[i] in map.values():
                    return False
                map[s[i]] = t[i]
            elif (map[s[i]] != t[i]):
                return False
        return True