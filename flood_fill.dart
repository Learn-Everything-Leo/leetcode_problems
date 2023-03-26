class Solution {
  void floodFillImp(
      List<List<int>> image, int sr, int sc, int newColor, int oldColor) {
    if (sr < 0 || sc < 0 || sr >= image.length || sc >= image[0].length) {
      return;
    }
    if (image[sr][sc] == newColor || image[sr][sc] != oldColor) {
      return;
    }

    image[sr][sc] = newColor;

    floodFillImp(image, sr - 1, sc, newColor, oldColor);
    floodFillImp(image, sr + 1, sc, newColor, oldColor);
    floodFillImp(image, sr, sc + 1, newColor, oldColor);
    floodFillImp(image, sr, sc - 1, newColor, oldColor);
  }

  List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
    floodFillImp(image, sr, sc, color, image[sr][sc]);
    return image;
  }
}
