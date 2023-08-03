class Solution {
  List<String> removeComments(List<String> source) {
    StringBuffer newLine = StringBuffer();
    bool isInCommentBlock = false;
    List<String> res = [];
    for (String line in source) {
      for (int i = 0; i < line.length; i++) {
        if (isInCommentBlock) {
          if (i + 1 < line.length && line[i] == '*' && line[i + 1] == '/') {
            isInCommentBlock = false;
            i++;
          }
        } else {
          if (i + 1 < line.length && line[i] == '/' && line[i + 1] == '/') {
            break;
          } else if (i + 1 < line.length &&
              line[i] == '/' &&
              line[i + 1] == '*') {
            isInCommentBlock = true;
            i++;
          } else {
            newLine.write(line[i]);
          }
        }
      }
      if (!isInCommentBlock && newLine.toString().isNotEmpty) {
        res.add(newLine.toString());
        newLine.clear();
      }
    }
    return res;
  }
}
