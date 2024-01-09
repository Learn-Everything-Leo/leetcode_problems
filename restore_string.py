from ast import List


class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        length = len(s)
        result = [""] * length
        for i, ch in enumerate(s):
            result[indices[i]] = ch
        return "".join(result)
