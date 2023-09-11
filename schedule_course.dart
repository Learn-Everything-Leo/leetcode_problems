import 'priority_queue.dart';

class Solution {
  int scheduleCourse(List<List<int>> courses) {
    int time = 0;
    PriorityQueue<int> queue = new PriorityQueue<int>((a, b) => b - a);
    courses.sort((a, b) => a[1] - b[1]);
    for (int i = 0; i < courses.length; i++) {
      int duration = courses[i][0], end = courses[i][1];
      if (time + duration <= end) {
        time += duration;
        queue.add(duration);
      } else if (queue.isNotEmpty && queue.first > duration) {
        time += duration - queue.removeFirst();
        queue.add(duration);
      }
    }

    return queue.length;
  }
}
