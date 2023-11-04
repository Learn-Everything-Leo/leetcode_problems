class Solution:
    def findMaximumXOR(self, nums: List[int]) -> int:
        ans = 0
        for l in range(30, -1, -1):
            target = ans * 2 + 1
            seen = set()
            for n in nums:
                seen.add((n >> l) ^ target)

            for n in nums:
                if n >> l in seen:
                    ans = target
                    break
            else:
                ans = target - 1

        return ans