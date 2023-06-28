class Solution {
  List<String> map = [
    "",
    "",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    'wxyz'
  ];

  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) {
      return [];
    }
    List<String> res = [];
    dfs(res, 0, "", digits);
    return res;
  }

  void dfs(List<String> res, int pos, String path, String digits) {
    if (pos == digits.length) {
      res.add(path);
      return;
    }
    String str = map[int.parse(digits[pos])];
    for (int i = 0; i < str.length; i++) {
      path = path + str[i];
      dfs(res, pos + 1, path, digits);
      path = path.substring(0, path.length - 1);
    }
  }
}
