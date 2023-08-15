class Solution {
  String findReplaceString(
      String s, List<int> indices, List<String> sources, List<String> targets) {
    List<List<int>> indicesList =
        List.generate(indices.length, (index) => [index, indices[index]]);
    indicesList.sort((a, b) => a[1].compareTo(b[1]));
    int offset = 0;
    for (int i = 0; i < indicesList.length; i++) {
      int index = indicesList[i][0];
      int start = indicesList[i][1] + offset;
      int length = sources[index].length;
      if (start >= 0 && start + length <=  s.length && sources[index] == s.substring(start, start + length)) {
        s = s.replaceRange(start, start + length, targets[index]);
        offset += (targets[index].length - sources[index].length);
      }
    }
    return s;
  }
}
