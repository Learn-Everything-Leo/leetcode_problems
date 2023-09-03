class Solution {
  int eliminateMaximum(List<int> dist, List<int> speed) {
    List<double> time = [];
    for (int i = 0; i < dist.length; i++) {
      time.add(dist[i] / speed[i]);
    }
    time.sort();
    int count = 0;
    for (int i = 0; i < time.length; i++) {
      if (time[i] <= i) {
        break;
      }
      count++;
    }
    return count;
  }
}