from ast import List


class Solution:
    def minimumRefill(self, plants: List[int], capacityA: int, capacityB: int) -> int:
        res = 0   # 灌满水罐次数
        n = len(plants)
        posa, posb = 0, n - 1   # 两人位置
        vala, valb = capacityA, capacityB   # 两人剩余水量
        # 模拟相遇前的浇水过程
        while posa < posb:
            if vala < plants[posa]:
                res += 1
                vala = capacityA - plants[posa]
            else:
                vala -= plants[posa]
            posa += 1
            if valb < plants[posb]:
                res += 1
                valb = capacityB - plants[posb]
            else:
                valb -= plants[posb]
            posb -= 1
        # 模拟相遇后可能的浇水过程
        if posa == posb:
            if vala >= valb and vala < plants[posa]:
                res += 1
            elif vala < valb and valb < plants[posb]:
                res += 1
        return res