class Solution:
    def maxArea(self, h: int, w: int, horizontalCuts: List[int], verticalCuts: List[int]) -> int:
        def calMax(arr, boarder):
            res, pre = 0, 0
            for i in arr:
                res = max(i - pre, res)
                pre = i
            return max(res, boarder - pre)
        horizontalCuts.sort()
        verticalCuts.sort()
        return (calMax(horizontalCuts, h) * calMax(verticalCuts, w)) % (10 ** 9 + 7)
