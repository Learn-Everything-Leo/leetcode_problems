class Solution:
    def sumDistance(self, nums: List[int], s: str, d: int) -> int:
        mod = 10**9 + 7
        n = len(nums)
        pos = [nums[i] - d if s[i] == 'L' else nums[i] + d for i in range(n)]
        pos.sort()
        return sum([(pos[i] - pos[i - 1]) * i * (n - i) for i in range(1, n)]) % mod