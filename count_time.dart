class Solution {
  int countTime(String time) {
    int res = 1;
    if (time[4] == '?') {
      res *= 10;
    }
    if (time[3] == '?') {
      res *= 6;
    }
    if (time[0] == '?' && time[1] == '?') {
      res *= 24;
    } else if (time[0] == '?') {
      if (int.parse(time[1]) <= 3) {
        res *= 3;
      } else {
        res *= 2;
      }
    } else if (time[1] == '?') {
      if (int.parse(time[0]) <= 1) {
        res *= 10;
      } else {
        res *= 4;
      }
    }

    return res;
  }
}
