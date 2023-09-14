class Solution:
    def giveGem(self, gem: List[int], operations: List[List[int]]) -> int:
        for (x, y) in operations:
            gem[y] += gem[x] // 2
            gem[x] -= gem[x] // 2
        return max(gem) - min(gem)