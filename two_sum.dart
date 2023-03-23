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
        return [index1, index2];
      }
    }
    return [];
  }
}

class Solution2 {
  List<int> twoSum(List<int> numbers, int target) {
    int left = 0, right = numbers.length - 1;
    int res = numbers[left] + numbers[right];
    while (res != target) {
      if (res > target) {
        right--;
      } else {
        left++;
      }
      res = numbers[left] + numbers[right];
    }
    return [left + 1, right + 1];
  }
}
