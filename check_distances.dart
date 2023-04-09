class Solution {
  bool checkDistances(String s, List<int> distance) {
    Map<String, int> map = {};
    for (int i = 0; i < s.length; i++) {
      if (map[s[i]] == null) {
        map[s[i]] = i;
      } else {
        map[s[i]] = i - map[s[i]]! - 1;
      }
    }
    for (var entry in map.entries) {
      if (entry.value != distance[entry.key.codeUnitAt(0) - 97]) {
        return false;
      }
    }
    return true;
  }
}
