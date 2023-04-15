class Solution {
  List<int> gardenNoAdj(int n, List<List<int>> paths) {
    List<int> res = List.filled(n, 0);
    Map<int, List<int>> map = {};
    for (List<int> path in paths) {
      if (map[path.first] == null) {
        map[path.first] = [path.last];
      } else {
        map[path.first]!.add(path.last);
      }
      if (map[path.last] == null) {
        map[path.last] = [path.first];
      } else {
        map[path.last]!.add(path.first);
      }
    }
    for (int i = 0; i < n; i++) {
      if (map[i + 1] == null) {
        res[i] = 1;
      } else {
        List<int> adjList = map[i + 1]!;
        List<int> resList = [1, 2, 3, 4];
        res[i] = resList.where((element) {
          for (int adj in adjList) {
            if (element == res[adj - 1]) {
              return false;
            }
          }
          return true;
        }).first;
      }
    }

    return res;
  }
}
