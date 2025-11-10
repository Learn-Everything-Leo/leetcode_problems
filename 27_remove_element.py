class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        n = len(nums)
        i, j = 0, n - 1
        while i < j:
            while i < j and nums[i] != val:
                i += 1
            while i < j and nums[j] == val:
                j -= 1
            if i < j:
                nums[i], nums[j] = nums[j], nums[i]
        if i < n:
            if nums[i] == val:
                return i
            else:
                return i + 1
        else:
            return n
         