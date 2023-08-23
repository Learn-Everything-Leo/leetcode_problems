import 'dart:math';

class Solution {
  List<int> countPairs(int n, List<List<int>> edges, List<int> queries) {
    List<int> degree = List.generate(n, (index) => 0);
    Map<int, int> cnt = Map();
    for (List<int> edge in edges) {
      int x = edge[0] - 1, y = edge[1] - 1;
      if (x > y) {
        int temp = x;
        x = y;
        y = temp;
      }
      degree[x]++;
      degree[y]++;
      cnt[x * n + y] = (cnt[x * n + y] ?? 0) + 1;
    }
    List<int> arr = List.generate(n, (index) => degree[index]);
    List<int> ans = [];
    arr.sort();
    for (int k = 0; k < queries.length; k++) {
      int bound = queries[k], total = 0;
      for (int i = 0, j = n - 1; i < n; i++) {
        while (j > i && arr[i] + arr[j] > bound) {
          j--;
        }
        total += (n - 1) - max(i, j);
      }
      cnt.forEach((key, value) {
        int x = key ~/ n, y = key % n;
        if (degree[x] + degree[y] > bound &&
            degree[x] + degree[y] - value <= bound) {
          total--;
        }
      });
      ans.add(total);
    }
    return ans;
  }
}
