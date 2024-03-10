class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        a1 = []
        a2 = []
        for num in nums1:
            if (num in nums2 or num in a1):
                continue
            a1.append(num)
        for num in nums2:
            if (num in nums1 or num in a2):
                continue
            a2.append(num)
        return [a1, a2]