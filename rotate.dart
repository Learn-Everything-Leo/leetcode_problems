class Solution {
  List<int> swap(int x, int y) {
    x = x ^ y;
    y = x ^ y;
    x = x ^ y;
    return [x, y];
  }

  void reverse(List<int> nums, int start, int end) {
    while (start < end) {
      List<int> swapped = swap(nums[start], nums[end]);
      nums[start] = swapped[0];
      nums[end] = swapped[1];
      start++;
      end--;
    }
  }

  void rotate(List<int> nums, int k) {
    if (nums.isEmpty || k == 0) {
      return;
    }
    if (k % nums.length == 0) {
      return;
    }
    k %= nums.length;
    reverse(nums, 0, nums.length - 1);
    reverse(nums, 0, k - 1);
    reverse(nums, k, nums.length - 1);
  }
}
