class Solution:
    def minLength(self, s: str) -> int:
        sta = []
        for c in s:
            if (len(sta) > 0 and ((sta[-1] == 'C' and c == 'D') or (sta[-1] == 'A' and c == 'B'))):
                sta.pop()
            else:
                sta.append(c)
        return len(sta)