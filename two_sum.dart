class Solution {
  int binarySearch(List<int> numbers, int left, int right, int target) {
    int l = left, r = right, mid;
    while (l <= r) {
      mid = l + ((r - l) / 2).floor();
      if (target == numbers[mid]) {
        return mid;
      }
      if (target > numbers[mid]) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    return -1;
  }

  List<int> twoSum(List<int> numbers, int target) {
    for (int i = 0; i < numbers.length - 1; i++) {
      int index1 = i;
      int index2 = binarySearch(
          numbers, i + 1, numbers.length - 1, target - numbers[index1]);
      if (index2 != -1) {
        return [index1 + 1, index2 + 1];
      }
    }
    return [];
  }
}
