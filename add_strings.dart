import 'dart:math';

class Solution {
  String addStrings(String num1, String num2) {
    String num1Reversed = num1.split('').reversed.join('');
    String num2Reversed = num2.split('').reversed.join('');
    int m = num1Reversed.length, n = num2Reversed.length;
    int carryOne = 0;
    StringBuffer res = StringBuffer();
    for (int i = 0; i < min(m, n); i++) {
      int sum =
          int.parse(num1Reversed[i]) + int.parse(num2Reversed[i]) + carryOne;
      res.write(sum % 10);
      carryOne = sum ~/ 10;
    }
    bool num1Longer = m > n;
    for (int i = min(m, n); i < max(m, n); i++) {
      int sum = (num1Longer
              ? int.parse(num1Reversed[i])
              : int.parse(num2Reversed[i])) +
          carryOne;
      res.write(sum % 10);
      carryOne = sum ~/ 10;
    }
    if (carryOne > 0) {
      res.write(carryOne);
    }
    return res.toString().split('').reversed.join('');
  }

  String addStrings2(String num1, String num2) {
    int m = num1.length, n = num2.length;
    int carryOne = 0;
    int index1 = m - 1, index2 = n - 1;
    StringBuffer res = StringBuffer();
    while (index1 >= 0 || index2 >= 0 || carryOne > 0) {
      int x = index1 >= 0 ? int.parse(num1[index1]) : 0;
      int y = index2 >= 0 ? int.parse(num2[index2]) : 0;
      int sum = x + y + carryOne;
      res.write(sum % 10);
      carryOne = sum ~/ 10;
      index1--;
      index2--;
    }
    return res.toString().split('').reversed.join('');
  }
}
