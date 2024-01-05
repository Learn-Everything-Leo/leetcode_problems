from ast import List


class Solution:
    def canSeePersonsCount(self, heights: List[int]) -> List[int]:
        n = len(heights)
        stack = []
        res = [0] * n
        for i in range(n - 1, -1, -1):
            h = heights[i]
            while stack and h > stack[-1]:
                res[i] += 1
                stack.pop()
            if stack:
                res[i] += 1
            stack.append(h)
        return res