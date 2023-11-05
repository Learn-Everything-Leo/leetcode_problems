from ast import List


class Solution:
    def findChampion(self, n: int, edges: List[List[int]]) -> int:
        arr = [i for i in range(n)]
        for edge in edges:
            for (_, v) in enumerate(arr):
                if v == edge[1]:
                    arr.remove(v)
        if len(arr) == 1:
            return arr[0]
        else:
            return -1
        
