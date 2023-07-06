class Solution {
  List<int> maximumEvenSplit(int finalSum) {
    if (finalSum % 2 != 0) {
      return [];
    }
    List<int> res = [2];
    int n = 1;
    while (n * (n + 1) < finalSum) {
      res.add(2 * (n + 1));
      n++;
    }
    res.remove(n * (n + 1) - finalSum);
    return res;
  }
}
