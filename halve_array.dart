import 'priority_queue.dart';

class Solution {
  int halveArray(List<int> nums) {
    int sum = 0;
    for (int num in nums) {
      sum += num;
    }
    double halfSum = sum.toDouble() / 2;
    PriorityQueue<double> priorityQueue =
        PriorityQueue((a, b) => b.compareTo(a));
    for (int num in nums) {
      priorityQueue.add(num.toDouble());
    }
    double minusSum = 0.0;
    int res = 0;
    while (minusSum < halfSum) {
      double maxNum = priorityQueue.removeFirst();
      minusSum += maxNum / 2;
      priorityQueue.add(maxNum / 2);
      res++;
    }
    return res;
  }
}
