class Solution {
  bool haveConflict(List<String> event1, List<String> event2) {
    return !(compare(event2.first, event1.last) > 0 ||
        compare(event1.first, event2.last) > 0);
  }

  int compare(String time1, String time2) {
    if (time1 == time2) {
      return 0;
    }
    if (int.parse(time1.substring(0, 2)) == int.parse(time2.substring(0, 2))) {
      return int.parse(time1.substring(3)) < int.parse(time2.substring(3))
          ? -1
          : 1;
    }
    return int.parse(time1.substring(0, 2)) < int.parse(time2.substring(0, 2))
        ? -1
        : 1;
  }
}
