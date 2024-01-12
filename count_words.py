from ast import List


class Solution:
    def countWords(self, words1: List[str], words2: List[str]) -> int:
        map1 = {}
        map2 = {}
        for word in words1:
            if word not in map1:
                map1[word] = 0
            map1[word] += 1
        for word in words2:
            if word not in map2:
                map2[word] = 0
            map2[word] += 1
        cnt = 0
        for word in words1:
            if word in map2 and map1[word] == 1 and map2[word] == 1:
                cnt += 1
        return cnt 