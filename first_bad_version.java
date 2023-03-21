/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        if (isBadVersion(1)) {
            return 1;
        }
        int left = 1, right = n;
        int mid = left + ((right - left) >> 1);
        while (left < right) {
            if (isBadVersion(mid)) {
                right = mid;
            } else {
                left = mid + 1;
            }
            mid = left + ((right - left) >> 1);
        }
        return mid;
    }
}