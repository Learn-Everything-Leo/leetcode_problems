class Solution:
    def earliestFullBloom(self, plantTime: List[int], growTime: List[int]) -> int:
        plants = [(plantTime[i], growTime[i]) for i in range(len(plantTime))]
        plants.sort(key=lambda x: x[1], reverse=True)
        prev = res = 0
        for i in range(len(plants)):
            res = max(res, plants[i][0] + plants[i][1] + prev)
            prev += plants[i][1]
        return res