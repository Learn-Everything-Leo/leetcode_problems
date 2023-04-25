class Solution {
  List<String> sortPeople(List<String> names, List<int> heights) {
    Map<int, String> map = {};
    for (int i = 0; i < names.length; i++) {
      map[heights[i]] = names[i];
    }
    heights.sort((a, b) => b.compareTo(a));
    List<String> res = [];
    for (int i = 0; i < heights.length; i++) {
      res.add(map[heights[i]]!);
    }
    return res;
  }
}
