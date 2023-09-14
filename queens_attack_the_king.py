class Solution:
    def queensAttacktheKing(self, queens: List[List[int]], king: List[int]) -> List[List[int]]:
        res = []
        queens = {(i, j) for i, j in queens} # 将queens列表转换为集合以加速查找

        # 定义8个方向的移动
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0), (-1, -1), (-1, 1), (1, -1), (1, 1)]

        for dx, dy in directions:
            x, y = king
            while 0 <= x < 8 and 0 <= y < 8:
                if (x, y) in queens:
                    res.append([x, y])
                    break
                x, y = x + dx, y + dy
        
        return res
