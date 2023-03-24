class Solution {
  String reverseWords(String s) {
    return s.split(" ").map((e) => e.split("").reversed.join("")).join(" ");
  }
}
