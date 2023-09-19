class Solution:
    def minCapability(self, nums: List[int], k: int) -> int:
        lower = min(nums)
        upper = max(nums)
        while lower <= upper:
            middle = (lower + upper) // 2
            count = 0
            visited = False
            for num in nums:
                if num <= middle and not visited:
                    visited = True
                    count += 1
                else:
                    visited = False
            if count >= k:
                upper = middle - 1
            else:
                lower = middle + 1
        return lower