import 'dart:math';

class Solution {
  bool checkOverlap(
      int radius, int xCenter, int yCenter, int x1, int y1, int x2, int y2) {
    if (xCenter >= x1 && xCenter <= x2 && yCenter >= y1 && yCenter <= y2) {
      return true;
    }
    if (xCenter >= x1 &&
        xCenter <= x2 &&
        yCenter >= y2 &&
        yCenter <= y2 + radius) {
      return true;
    }
    if (xCenter >= x1 &&
        xCenter <= x2 &&
        yCenter >= y1 - radius &&
        yCenter <= y1) {
      return true;
    }
    if (yCenter >= y1 &&
        yCenter <= y2 &&
        xCenter >= x1 - radius &&
        xCenter <= x1) {
      return true;
    }
    if (yCenter >= y1 &&
        yCenter <= y2 &&
        xCenter >= x2 &&
        xCenter <= x2 + radius) {
      return true;
    }
    if (distance(xCenter, yCenter, x1, y2) <= radius * radius) {
      return true;
    }
    if (distance(xCenter, yCenter, x1, y1) <= radius * radius) {
      return true;
    }
    if (distance(xCenter, yCenter, x2, y2) <= radius * radius) {
      return true;
    }
    if (distance(xCenter, yCenter, x2, y1) <= radius * radius) {
      return true;
    }

    return false;
  }

  int distance(int x1, int y1, int x2, int y2) {
    return pow(x1 - x2, 2).toInt() + pow(y1 - y2, 2).toInt();
  }
}
