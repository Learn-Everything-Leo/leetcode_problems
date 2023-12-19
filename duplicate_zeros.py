class Solution:
    def duplicateZeros(self, arr) -> None:
        head, tail = 0, len(arr)
        while head < tail:
            if head < tail - 1 and arr[head] == 0:
                arr.pop()
                arr.insert(head+1, 0)
                head += 1
            head += 1