from ast import List


class Solution:
    def maximumSumQueries(self, nums1: List[int], nums2: List[int], queries: List[List[int]]) -> List[int]:
        sortedNums = sorted([[a, b] for a, b in zip(nums1, nums2)], key = lambda x: -x[0])
        sortedQueries = sorted([[i, x, y] for i, (x, y) in enumerate(queries)], key=lambda q:-q[1])
        stack = []
        answer = [-1] * len(queries)
        j = 0
        for i, x, y in sortedQueries:
            while j < len(sortedNums) and sortedNums[j][0] >= x:
                num1, num2 = sortedNums[j]
                while stack and stack[-1][1] <= num1 + num2:
                    stack.pop()
                if not stack or stack[-1][0] < num2:
                    stack.append([num2, num1 + num2])
                j += 1
            k = bisect_left(stack, [y, 0])
            if k < len(stack):
                answer[i] = stack[k][1]
        return answer