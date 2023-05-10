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

class Solution2 {
  int res = 0;

  int countTime(String time) {
    dfs(time, 0);
    return res;
  }

  void dfs(String time, int pos) {
    if (pos == time.length) {
      if (isValid(time)) {
        res++;
      }
      return;
    }
    if (time[pos] == '?') {
      for (int i = 0; i <= 9; i++) {
        time = time.replaceRange(pos, pos + 1, i.toString());
        dfs(time, pos + 1);
        // 其实这一步是没必要的
        time = time.replaceRange(pos, pos + 1, "?");
      }
    } else {
      dfs(time, pos + 1);
    }
  }

  bool isValid(String time) {
    List<String> numbers = time.split(":");
    return int.parse(numbers[0]) <= 23 && int.parse(numbers[1]) <= 59;
  }
}
