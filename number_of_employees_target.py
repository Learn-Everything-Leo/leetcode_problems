class Solution(object):
    def numberOfEmployeesWhoMetTarget(self, hours, target):
        ans = 0

        for i in range(0, len(hours)):
            if hours[i] >= target:
                ans += 1
        return ans