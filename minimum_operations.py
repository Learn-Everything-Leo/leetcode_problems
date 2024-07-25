class Solution:
    def minimumOperations(self, num: str) -> int:
        n = len(num)
        find0 = find5 = False
        for i in range(n - 1, -1, -1):
            if (num[i] == '2' or num[i] == '7') and find5:
                return n - i - 2
            if (num[i] == '5' or num[i] == '0') and find0:
                return n - i - 2
            if num[i] == '5':
                find5 = True
            elif num[i] == '0':
                find0 = True
        if find0:
            return n - 1
        return n