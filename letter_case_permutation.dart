class Solution {
  bool isLetter(String s) {
    if (s.isEmpty) {
      return false;
    }
    RegExp regex = RegExp(r'[a-zA-Z]');
    return regex.hasMatch(s[0]);
  }

  List<String> letterCasePermutation(String s) {
    List<String> res = [s];
    for (int i = 0; i < s.length; i++) {
      if (!isLetter(s[i])) {
        continue;
      }
      List<String> nextRoundRes = [];
      for (String item in res) {
        nextRoundRes.add(
            item.substring(0, i) + s[i].toLowerCase() + item.substring(i + 1));
        nextRoundRes.add(
            item.substring(0, i) + s[i].toUpperCase() + item.substring(i + 1));
      }
      res = nextRoundRes;
    }

    return res;
  }
}
