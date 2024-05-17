from ast import List


class Solution:
    def maxProfitAssignment(self, difficulty: List[int], profit: List[int], worker: List[int]) -> int:
        jobs = sorted(zip(difficulty, profit))
        res = max_profit = i = 0
        worker.sort()
        for w in worker:
            while i < len(jobs) and w >= jobs[i][0]:
                max_profit = max(max_profit, jobs[i][1])
                i += 1
            res += max_profit
        return res
        