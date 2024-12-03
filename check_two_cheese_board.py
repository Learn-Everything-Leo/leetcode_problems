class Solution:
    def checkTwoChessboards(self, coordinate1: str, coordinate2: str) -> bool:
        row = ord(coordinate2[0]) - ord(coordinate1[0])
        col = ord(coordinate2[1]) - ord(coordinate1[1])
        return (abs(row) + abs(col)) % 2 == 0