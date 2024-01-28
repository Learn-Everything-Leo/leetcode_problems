from ast import List


class Solution:
    def maxNumberOfAlloys(self, n: int, k: int, budget: int, composition: List[List[int]], stock: List[int], cost: List[int]) -> int:
        left, right, ans = 1, 2 * 10**8, 0
        while left <= right:
            mid = (left + right) // 2
            valid = False
            for i in range(k):
                spend = 0
                for j, (composition_j, stock_j, cost_j) in enumerate(zip(composition[i], stock, cost)):
                    spend += max(composition_j * mid - stock_j, 0) * cost_j
                if spend <= budget:
                    valid = True
                    break
            if valid:
                ans = mid
                left = mid + 1
            else:
                right = mid - 1
        return ans