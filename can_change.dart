class Solution {
  bool canChange(String start, String target) {
    int n = start.length;
    int index1 = 0, index2 = 0;
    while (index1 < n && index2 < n) {
      while (index1 < n && start[index1] == '_') {
        index1++;
        continue;
      }
      while (index2 < n && target[index2] == '_') {
        index2++;
        continue;
      }
      if (index1 < n && index2 < n) {
        if (start[index1] != target[index2]) {
          return false;
        }
        if (start[index1] == "L" && index1 < index2) {
          return false;
        }
        if (start[index1] == "R" && index1 > index2) {
          return false;
        }
        index1++;
        index2++;
      }
    }
    while (index1 < n) {
      if (start[index1] != '_') {
        return false;
      }
      index1++;
    }
    while (index2 < n) {
      if (target[index2] != '_') {
        return false;
      }
      index2++;
    }
    return true;
  }
}
