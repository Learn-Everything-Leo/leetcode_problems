class Solution {
  String oddString(List<String> words) {
    Map<String, int> map = {};
    for (String word in words) {
      String key = convertWordToNumberString(word);
      if (map[key] == null) {
        map[key] = 1;
      } else {
        map[key] = map[key]! + 1;
      }
    }
    for (String word in words) {
      String key = convertWordToNumberString(word);
      if (map[key] == 1) {
        return word;
      }
    }
    return "";
  }

  String convertWordToNumberString(String word) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 1; i < word.length; i++) {
      stringBuffer.write(
          (word[i].codeUnitAt(0) - word[i - 1].codeUnitAt(0)).toString() + "-");
    }
    return stringBuffer.toString();
  }
}
