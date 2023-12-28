from ast import List


class Solution:
    def buyChoco(self, prices: List[int], money: int) -> int:
        res = 0
        prices.sort()
        moneyCopy = money
        for p in prices:
            res += 1
            moneyCopy -= p
            if (res == 2):
                break
        if (moneyCopy < 0):
            return money
        return moneyCopy