class Solution {
  int numPairsDivisibleBy60Another(List<int> time) {
    List<int> map = List.filled(60, 0);
    int res = 0;
    for (int i = 0; i < time.length; i++) {
      int mod = time[i] % 60;
      if (mod == 0) {
        res += map[0];
      } else {
        res += map[60 - mod];
      }
      map[mod]++;
    }
    return res;
  }

  int numPairsDivisibleBy60(List<int> time) {
    time.sort();
    int n = time.length;
    int res = 0;
    for (int i = 0; i < n - 1; i++) {
      for (int sum = 60; sum <= 960; sum += 60) {
        if (time[i] >= sum || sum - time[i] > 500) {
          continue;
        }
        int left = lowerBound(time, i + 1, n, sum - time[i]);
        int right = lowerBound(time, i + 1, n, sum - time[i] + 1);
        res += (right - left);
      }
    }
    return res;
  }

  int lowerBound(List<int> time, int left, int right, int target) {
    while (left < right) {
      int mid = (left + right) >> 1;
      if (time[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}
