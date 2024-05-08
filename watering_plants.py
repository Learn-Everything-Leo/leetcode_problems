from ast import List


class Solution:
    def wateringPlants(self, plants: List[int], capacity: int) -> int:
        ans, rest = 0, capacity

        for i, plant in enumerate(plants):
            if rest >= plants[i]:
                ans += 1
                rest -= plants[i]
            else:
                ans += i * 2 + 1
                rest = capacity - plants[i]
        
        return ans
