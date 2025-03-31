#
# @lc app=leetcode.cn id=2278 lang=python3
#
# [2278] 字母在字符串中的百分比
#

# @lc code=start
class Solution:
    def percentageLetter(self, s: str, letter: str) -> int:
        count = s.count(letter)
        return int(count / len(s) * 100)
        
# @lc code=end

