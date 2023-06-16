import java.util.ArrayList;
import java.util.List;

class Solution {
    public List<Boolean> canMakePaliQueries(String s, int[][] queries) {
        int n = s.length();
        int[] countList = new int[n + 1];
        for (int i = 0; i < n; i++) {
            countList[i + 1] = countList[i] ^ (1 << s.charAt(i) - 'a');
        }
        List<Boolean> res = new ArrayList<Boolean>();
        for (int[] query : queries) {
            int l = query[0], r = query[1], k = query[2];
            int bits = 0, x = countList[r + 1] ^ countList[l];
            while (x > 0) {
                x &= x - 1;
                bits++;
            }
            res.add(bits <= 2 * k + 1);
        }
        return res;
    }
}