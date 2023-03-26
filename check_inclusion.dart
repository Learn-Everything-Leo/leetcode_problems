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

class Solution2 {
  bool checkInclusion(String s1, String s2) {
    int n = s1.length, m = s2.length;
    if (n > m) {
      return false;
    }
    Map<String, int> countMap = {};
    for (int i = 0; i < n; i++) {
      if (countMap.containsKey(s1[i])) {
        countMap[s1[i]] = countMap[s1[i]]! + 1;
      } else {
        countMap[s1[i]] = 1;
      }
      if (countMap.containsKey(s2[i])) {
        countMap[s2[i]] = countMap[s2[i]]! - 1;
      } else {
        countMap[s2[i]] = -1;
      }
    }

    int diff = 0;
    for (var count in countMap.values) {
      if (count != 0) {
        diff++;
      }
    }

    if (diff == 0) {
      return true;
    }

    for (int i = n; i < m; i++) {
      String x = s2[i - n], y = s2[i];
      if (x == y) {
        continue;
      }

      if ((countMap[x] ?? 0) == 0) {
        diff++;
      }
      if (countMap.containsKey(x)) {
        countMap[x] = countMap[x]! + 1;
      } else {
        countMap[x] = 1;
      }
      if (countMap[x] == 0) {
        diff--;
      }

      if ((countMap[y] ?? 0) == 0) {
        diff++;
      }
      if (countMap.containsKey(y)) {
        countMap[y] = countMap[y]! - 1;
      } else {
        countMap[y] = -1;
      }
      if (countMap[y] == 0) {
        diff--;
      }

      if (diff == 0) {
        return true;
      }
    }

    return false;
  }
}

class Solution3 {
  bool checkInclusion(String s1, String s2) {
    int n = s1.length, m = s2.length;
    if (n > m) {
      return false;
    }
    Map<String, int> countMap = {};
    s1.split('').forEach((element) {
      if (countMap.containsKey(element)) {
        countMap[element] = countMap[element]! - 1;
      } else {
        countMap[element] = -1;
      }
    });
    int left = 0;
    for (int right = 0; right < m; right++) {
      String x = s2[right];
      if (countMap.containsKey(x)) {
        countMap[x] = countMap[x]! + 1;
      } else {
        countMap[x] = 1;
      }
      while (countMap[x]! > 0) {
        countMap[s2[left]] = countMap[s2[left]]! - 1;
        left++;
      }
      if (right - left + 1 == n) {
        return true;
      }
    }
    return false;
  }
}
