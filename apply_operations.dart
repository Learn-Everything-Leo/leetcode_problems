class Solution {
  List<int> applyOperations(List<int> nums) {
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] == nums[i + 1]) {
        nums[i] = 2 * nums[i];
        nums[i + 1] = 0;
      }
    }
    List<int> res = List.generate(nums.length, (index) => 0);
    int index = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != 0) {
        res[index++] = nums[i];
      }
    }
    return res;
  }
}
