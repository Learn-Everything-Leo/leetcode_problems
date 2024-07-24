from ast import List


class Solution:
    def relocateMarbles(self, nums: List[int], moveFrom: List[int], moveTo: List[int]) -> List[int]:
        numsSet = set(nums)
        for i in range(len(moveFrom)):
            if moveFrom[i] in numsSet:
                numsSet.remove(moveFrom[i])
                numsSet.add(moveTo[i])
        return sorted(list(numsSet))
        