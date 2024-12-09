class Solution:
    def squareIsWhite(self, coordinates: str) -> bool:
        row, col = ord(coordinates[0]) - ord('a'), int(coordinates[1]) - 1
        return (row + col) % 2 != 0