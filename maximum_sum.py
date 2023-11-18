from ast import List


class Solution:
    def maximumSum(self, nums: List[int]) -> int:
        ans = -1
        mx = [0] * 82  # 至多 9 个 9 相加
        for num in nums:
            # s = sum(map(int, str(num)))
            # 不转成 str，效率更高
            s = 0
            x = num
            while x:  # 枚举 num 的每个数位
                s += x % 10
                x //= 10
            if mx[s]:  # 说明左边也有数位和等于 s 的元素
                ans = max(ans, mx[s] + num)  # 更新答案的最大值
            mx[s] = max(mx[s], num)  # 维护数位和等于 s 的最大元素
        return ans