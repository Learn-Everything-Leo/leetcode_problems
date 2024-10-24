from ast import List


class Solution:
    def findWinningPlayer(self, skills: List[int], k: int) -> int:
        n = len(skills)
        maxSkill = max(skills)
        maxIndex = skills.index(maxSkill)
        if (k >= maxIndex):
            return maxIndex
        for i in range(0, maxIndex):
            j = i + 1
            while (j < n and skills[j] < skills[i]):
                j += 1
            if ((j - i - (i == 0)) >= k):
                return i
            i = j
        return maxIndex