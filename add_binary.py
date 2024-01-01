class Solution:
    def addBinary(self, a: str, b: str) -> str:
        # 1. 将两个字符串转换成整数
        a = int(a, 2)
        b = int(b, 2)
        # 2. 将两个整数相加
        c = a + b
        # 3. 将相加的结果转换成二进制字符串
        return bin(c)[2:]