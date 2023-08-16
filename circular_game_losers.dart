class Solution {
  List<int> circularGameLosers(int n, int k) {
    List<int> hits = [1];
    int index = 1;
    int count = 1;
    while (true) {
      index = (index + count * k) % n;
      index = index == 0 ? n : index;
      count++;
      if (hits.contains(index)) {
        break;
      }
      hits.add(index);
    }
    List<int> res = [];
    for (int i = 1; i <= n; i++) {
      if (!hits.contains(i)) {
        res.add(i);
      }
    }
    return res;
  }
}
