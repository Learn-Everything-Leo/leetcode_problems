class Solution:
    def minMovesToCaptureTheQueen(self, a: int, b: int, c: int, d: int, e: int, f: int) -> int:
        if (a == e) and (c != a or not (d > min(b, f) and d < max(b, f))):
            return 1
        if (b == f) and (d != b or not (c > min(a, e) and c < max(a, e))):
            return 1
        if (abs(c - e) == abs(d - f)) and (abs(a - c) != abs(b - d) or not (a > min(c, e) and a < max(c, e) and b > min(d, f) and b < max(d, f))):
            return 1
        return 2