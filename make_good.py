class Solution:
    def makeGood(self, s: str) -> str:
        ret = list()
        for ch in s:
            if ret and ret[-1].lower() == ch.lower() and ret[-1] != ch:
                ret.pop()
            else:
                ret.append(ch)
        return "".join(ret)
