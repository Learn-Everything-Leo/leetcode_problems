class Solution:
    def thousandSeparator(self, n: int) -> str:
        ans = str(n)
        for i in range(len(ans) - 4, -1, -3):
            ans = ans[:i + 1] + "." + ans[i + 1:]
        return ans