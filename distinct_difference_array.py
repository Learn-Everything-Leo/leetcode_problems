from ast import List


class Solution:
    def distinctDifferenceArray(self, nums: List[int]) -> List[int]:
        n = len(nums)
        sufCnt = [0] * (n + 1)
        st = set()
        for i in range(n - 1, 0, -1):
            st.add(nums[i])
            sufCnt[i] = len(st)
        res = []
        st.clear()
        for i in range(n):
            st.add(nums[i])
            res.append(len(st) - sufCnt[i + 1])
        return res
