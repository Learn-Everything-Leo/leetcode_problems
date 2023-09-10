class Solution {
  List<List<int>> edges = [];
  List<int> visited = [];
  List<int> result = [];
  bool valid = true;

  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    edges = List.generate(numCourses, (index) => []);
    visited = List.generate(numCourses, (index) => 0);
    result = [];
    valid = true;
    for (var prerequisite in prerequisites) {
      edges[prerequisite[1]].add(prerequisite[0]);
    }
    for (int i = 0; i < numCourses && valid; i++) {
      if (visited[i] == 0) {
        dfs(i);
      }
    }
    return valid == true ? result.reversed.toList() : [];
  }

  void dfs(int u) {
    visited[u] = 1;
    for (int v in edges[u]) {
      if (visited[v] == 0) {
        dfs(v);
        if (!valid) {
          return;
        }
      } else if (visited[v] == 1) {
        valid = false;
        return;
      }
    }
    visited[u] = 2;
    result.add(u);
  }
}
