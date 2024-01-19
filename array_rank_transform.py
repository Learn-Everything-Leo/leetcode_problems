class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        map = {}
        rankArr = arr.copy()
        rankArr.sort()
        rank = 0
        for i in range(len(rankArr)):
            if i > 0 and rankArr[i] == rankArr[i - 1]:
                continue
            else:
                rank += 1
                map[rankArr[i]] = rank
        res = [0] * len(arr)
        for i in range(len(arr)):
            res[i] = map[arr[i]]
        return res
        