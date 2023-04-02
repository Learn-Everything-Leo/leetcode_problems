class Solution {
  void dfs(List<int> nums, int size, List<int> path, List<List<int>> res) {
    if (path.length == size) {
      res.add([...path]);
      return;
    }
    for (int i = 0; i < nums.length; i++) {
      path.add(nums[i]);
      List<int> copyList = [...nums];
      copyList.removeAt(i);
      dfs(copyList, size, path, res);
      path.removeLast();
    }
  }

  List<List<int>> permute(List<int> nums) {
    List<List<int>> res = [];
    dfs(nums, nums.length, [], res);
    return res;
  }
}
