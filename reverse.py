class Solution:
    def reverse(self, x: int) -> int:
        res = 0
        str_x = str(x)
        if str_x[0] == '-':
            str_x = str_x[1:]
            res = -int(str_x[::-1])
        else:
            res = int(str_x[::-1])
        if res > 2**31 - 1 or res < -2**31:
            return 0
        return res