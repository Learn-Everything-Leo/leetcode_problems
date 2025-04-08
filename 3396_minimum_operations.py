#
# @lc app=leetcode.cn id=3396 lang=python3
#
# [3396] 使数组元素互不相同所需的最少操作次数
#

# @lc code=start
from typing import Counter, List


class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        counter = Counter(nums)
        res = 0
        while True:
            flag = True
            for v in counter.values():
                if v > 1:
                    for i in range(res * 3, min((res + 1) * 3, len(nums))):
                        counter[nums[i]] -= 1
                    res += 1
                    flag = False
                    break
            if flag:
                break
        return res
            
            
        
# @lc code=end

