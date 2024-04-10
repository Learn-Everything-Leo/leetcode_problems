class Solution:
    def maximumBinaryString(self, binary: str) -> str:
        n = len(binary)
        s = list(binary)
        j = 0
        for i in range(n):
            if s[i] == '0':
                while j <= i or (j < n and s[j] == '1'):
                    j += 1
                if j < n:
                    s[j] = '1'
                    s[i] = '1'
                    s[i + 1] = '0'
        return ''.join(s)
