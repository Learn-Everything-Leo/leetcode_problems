class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    int index1 = m - 1, index2 = n - 1;
    int currentIndex = m + n - 1;
    while (index2 >= 0) {
      if (index1 < 0 || nums2[index2] >= nums1[index1]) {
        nums1[currentIndex] = nums2[index2];
        index2--;
      } else {
        nums1[currentIndex] = nums1[index1];
        index1--;
      }
      currentIndex--;
    }
  }
}
