class Solution {
  bool lemonadeChange(List<int> bills) {
    int fiveCount = 0, tenCount = 0;
    for (int bill in bills) {
      if (bill == 5) {
        fiveCount++;
      } else if (bill == 10) {
        fiveCount--;
        tenCount++;
      } else if (bill == 20) {
        if (tenCount > 0) {
          fiveCount--;
          tenCount--;
        } else {
          fiveCount -= 3;
        }
      }
      if (fiveCount < 0 || tenCount < 0) {
        return false;
      }
    }
    return true;
  }
}
