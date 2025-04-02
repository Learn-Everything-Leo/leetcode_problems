#
# @lc app=leetcode.cn id=2873 lang=python3
#
# [2873] 有序三元组中的最大值 I
#

# @lc code=start
from typing import List


class Solution:
    def maximumTripletValue(self, nums: List[int]) -> int:
        res = 0
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                for k in range(j + 1, n):
                    res = max(res, (nums[i] - nums[j]) * nums[k])
        return res
        
# @lc code=end

