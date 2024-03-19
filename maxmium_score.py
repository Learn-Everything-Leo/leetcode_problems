from ast import List


class Solution:
    def maximumScore(self, nums: List[int], k: int) -> int:
        n = len(nums)
        left, right, i = k - 1, k + 1, nums[k]
        ans = 0
        while True:
            while left >= 0 and nums[left] >= i:
                left -= 1
            while right < n and nums[right] >= i:
                right += 1
            ans = max(ans, (right - left - 1) * i)
            i = max((-1 if left == -1 else nums[left]), (-1 if right == n else nums[right]))
            if i == -1:
                break
        return ans
