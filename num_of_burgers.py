from ast import List


class Solution:
    def numOfBurgers(self, tomatoSlices: int, cheeseSlices: int) -> List[int]:
        if tomatoSlices % 2 == 1:
            return []
        jumbo = (tomatoSlices - 2 * cheeseSlices) // 2
        small = cheeseSlices - jumbo
        if jumbo < 0 or small < 0:
            return []
        return [jumbo, small]