class Solution {
  List<bool> canMakePaliQueries(String s, List<List<int>> queries) {
    List<bool> res = [];
    int n = s.length;
    List<int> countList = List.generate(n + 1, (index) => 0);
    for (int i = 0; i < n; i++) {
      countList[i + 1] =
          countList[i] ^ (1 << s[i].codeUnitAt(0) - 'a'.codeUnitAt(0));
    }
    for (List<int> query in queries) {
      int l = query[0], r = query[1], k = query[2];
      int bits = 0;
      int x = countList[r + 1] ^ countList[l];
      while (x > 0) {
        x &= x - 1;
        bits++;
      }
      res.add(bits ~/ 2 <= k);
    }
    return res;
  }
}
