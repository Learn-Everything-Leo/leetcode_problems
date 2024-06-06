class Solution:
    def minimumSteps(self, s):
        ans, sum = 0, 0
        for i in range(len(s)):
            if s[i] == '1':
                sum += 1
            else:
                ans += sum
        return ans