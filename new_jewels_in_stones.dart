class Solution {
  int numJewelsInStones(String jewels, String stones) {
    Map<String, bool> map = Map();
    for (int i = 0; i < jewels.length; i++) {
      map[jewels[i]] = true;
    }
    int res = 0;
    for (int i = 0; i < stones.length; i++) {
      res += (map[stones[i]] != null ? 1 : 0);
    }
    return res;
  }
}
