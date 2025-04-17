#
# @lc app=leetcode.cn id=2176 lang=python3
#
# [2176] 统计数组中相等且可以被整除的数对
#

# @lc code=start
class Solution:
    def countPairs(self, nums: List[int], k: int) -> int:
        res = 0
        n = len(nums)
        for i in range(0, n):
            for j in range(i + 1, n):
                if (nums[i] == nums[j] and (i * j) % k == 0):
                    res += 1
        return res
# @lc code=end

