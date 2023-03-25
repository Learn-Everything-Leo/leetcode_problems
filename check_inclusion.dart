class Solution {
  Map<String, int> getStringMapCount(String s) {
    Map<String, int> map = {};
    s.split('').forEach((char) {
      if (map[char] == null) {
        map[char] = 1;
      } else {
        map[char] = map[char]! + 1;
      }
    });
    return map;
  }

  bool isMapSame(Map<String, int> map1, Map<String, int> map2) {
    if (map1.length != map2.length) {
      return false;
    }

    for (var key in map1.keys) {
      if (!map2.containsKey(key) || map1[key] != map2[key]) {
        return false;
      }
    }

    return true;
  }

  bool checkInclusion(String s1, String s2) {
    Map<String, int> targetMap = getStringMapCount(s1);
    Map<String, int> subMap = {};
    for (int i = 0; i < s2.length - s1.length + 1; i++) {
      String sub = s2.substring(i, i + s1.length);
      subMap = getStringMapCount(sub);
      if (isMapSame(targetMap, subMap)) {
        return true;
      }
    }
    return false;
  }
}
