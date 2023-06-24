import 'dart:math';

class Solution {
  int maximumValue(List<String> strs) {
    int res = 0;
    for (String str in strs) {
      bool isNumber = true;
      for (int i = 0; i < str.length; i++) {
        if (str[i].codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
            str[i].codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
          res = max(res, str.length);
          isNumber = false;
          break;
        }
      }
      if (isNumber) {
        res = max(res, int.tryParse(str) ?? 0);
      }
    }
    return res;
  }
}
