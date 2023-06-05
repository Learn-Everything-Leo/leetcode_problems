import 'odd_string.dart';

void main() {
  int number = 123456789012345;
  List<int> result = splitNumber(number);
  // print(result);
  print(Solution().oddString(["abm", "bcn", "alm"]));
}

List<int> splitNumber(int number) {
  String numberString = number.toString();
  RegExp regExp = RegExp(r'(\d{1,4})(?=(\d{4})*$)');

  List<int> result = [];
  numberString.replaceAllMapped(regExp, (Match match) {
    String? subString = match.group(0);
    int parsed = int.parse(subString ?? '');
    result.add(parsed);
    return '';
  });

  return result;
}
