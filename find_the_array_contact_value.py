class Solution:
    def findTheArrayConcVal(self, nums: List[int]) -> int:
        ans = 0
        i, j = 0, len(nums) - 1
        while i <= j:
            if i != j:
                ans += int(str(nums[i]) + str(nums[j]))
            else:
                ans += nums[i]
            i += 1
            j -= 1
        return ans