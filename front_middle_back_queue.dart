class FrontMiddleBackQueue {
  List<int> nums = [];

  FrontMiddleBackQueue() {}

  void pushFront(int val) {
    nums.insert(0, val);
  }

  void pushMiddle(int val) {
    int length = nums.length;
    nums.insert(length ~/ 2, val);
  }

  void pushBack(int val) {
    nums.add(val);
  }

  int popFront() {
    if (nums.isEmpty) {
      return -1;
    }
    return nums.removeAt(0);
  }

  int popMiddle() {
    if (nums.isEmpty) {
      return -1;
    }
    int length = nums.length;
    if (length % 2 == 0) {
      return nums.removeAt(length ~/ 2 - 1);
    } else {
      return nums.removeAt(length ~/ 2);
    }
  }

  int popBack() {
    if (nums.isEmpty) {
      return -1;
    }
    return nums.removeLast();
  }
}

/**
 * Your FrontMiddleBackQueue object will be instantiated and called as such:
 * FrontMiddleBackQueue obj = FrontMiddleBackQueue();
 * obj.pushFront(val);
 * obj.pushMiddle(val);
 * obj.pushBack(val);
 * int param4 = obj.popFront();
 * int param5 = obj.popMiddle();
 * int param6 = obj.popBack();
 */