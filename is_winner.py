from ast import List


class Solution:
    def isWinner(self, player1: List[int], player2: List[int]) -> int:
        def score(player):
            res = 0
            for i, x in enumerate(player):
                if i > 0 and player[i - 1] == 10 or i > 1 and player[i - 2] == 10:
                    res += 2 * x
                else:
                    res += x
            return res
        
        s1, s2 = score(player1), score(player2)
        return 0 if s1 == s2 else 1 if s1 > s2 else 2