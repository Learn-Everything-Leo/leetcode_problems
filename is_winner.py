from ast import List


class Solution:
    def isWinner(self, player1: List[int], player2: List[int]) -> int:
        res, sum1, sum2 = 0, 0, 0
        n = len(player1)
        for i in range(n):
            sum1 += player1[i]
            sum2 += player2[i]
        if n > 2 and (player1[0] == 10 or player1[0] == 10):
            for i in range(2, n):
                    sum1 += player1[i]
        
        if n > 2 and (player2[0] == 10 or player2[0] == 10):
            for i in range(2, n):
                    sum2 += player2[i]
        res = 1 if sum1 > sum2 else 2
        if (sum1 == sum2):
            res = 0
        return res
