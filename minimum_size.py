from typing import List


class Solution:
    def minimumSize(self, nums: List[int], maxOperations: int) -> int:
        l, r, ans = 1, max(nums), 0
        while l <= r:
            mid = (l + r) >> 1
            op = sum((num - 1) // mid for num in nums)
            if op <= maxOperations:
                ans = mid
                r = mid - 1
            else:
                l = mid + 1
        return ans