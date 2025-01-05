from typing import List


class ATM:

    def __init__(self):
        self.cnt = [0] * 5
        self.values = [20, 50, 100, 200, 500]
        

    def deposit(self, banknotesCount: List[int]) -> None:
        for i in range(min(5, len(banknotesCount))):
            self.cnt[i] += banknotesCount[i]

    def withdraw(self, amount: int) -> List[int]:
        res = [0] * 5
        for i in range(min(4, len(self.values) - 1), -1, -1):
            res[i] = min(self.cnt[i], amount // self.values[i])
            amount -= res[i] * self.values[i]
        if amount > 0:
            return [-1]
        else:
            for i in range(5):
                self.cnt[i] -= res[i]
        return res
        
