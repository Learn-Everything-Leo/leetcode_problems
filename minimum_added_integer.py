from typing import List


class Solution:
    def minimumAddedInteger(self, nums1: List[int], nums2: List[int]) -> int:
        m, n = len(nums1), len(nums2)
        nums1.sort()
        nums2.sort()
        for i in [2, 1, 0]:
            left, right = i + 1, 1
            while left < m and right < n:
                if nums1[left] - nums2[right] == nums1[i] - nums2[0]:
                    right += 1
                left += 1
            if right == n:
                return nums2[0] - nums1[i]
        # 本题不会有无解的情况
        return 0