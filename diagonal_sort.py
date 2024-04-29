from ast import List


class Solution:
    def diagonalSort(self, mat: List[List[int]]) -> List[List[int]]:
        m = len(mat)
        n = len(mat[0])
        i = 0
        while i < m:
            startX, startY = i, 0
            temp = []
            while startX < m and startY < n:
                temp.append(mat[startX][startY])
                startX += 1
                startY += 1
            temp.sort()
            startX, startY = i, 0
            count = 0
            while startX < m and startY < n:
                mat[startX][startY] = temp[count]
                count += 1
                startX += 1
                startY += 1
            i += 1
        i = 1
        while i < n:
            startX, startY = 0, i
            temp = []
            while startX < m and startY < n:
                temp.append(mat[startX][startY])
                startX += 1
                startY += 1
            temp.sort()
            startX, startY = 0, i
            count = 0
            while startX < m and startY < n:
                mat[startX][startY] = temp[count]
                count += 1
                startX += 1
                startY += 1
            i += 1
        return mat