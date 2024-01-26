class Solution:
    def makeFancyString(self, s: str) -> str:
        res = []   # 删除后的字符串
        # 遍历 s 模拟删除过程
        for ch in s:
            if len(res) >= 2 and res[-1] == res[-2] == ch:
                # 如果 res 最后两个字符与当前字符均相等，则不添加
                continue
            # 反之则添加
            res.append(ch)
        return "".join(res)
