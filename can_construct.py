class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        map1 = {}
        map2 = {}
        for c in ransomNote:
            map1[c] = map1.get(c, 0) + 1
        for c in magazine:
            map2[c] = map2.get(c, 0) + 1
        for key in map1:
            if key not in map2 or map1[key] > map2[key]:
                return False
        return True
