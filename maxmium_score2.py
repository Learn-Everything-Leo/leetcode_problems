from typing import List


class Solution:
    def maxmiumScore(self, cards: List[int], cnt: int) -> int:
        odd = [num for num in cards if num % 2 == 1]
        even = [num for num in cards if num % 2 == 0]
        odd.sort(reverse=True)
        even.sort(reverse=True)
        res = 0
        while (cnt > 0):
            if (cnt % 2 == 1):
                if (len(even) == 0):
                    return 0
                res += even[0]
                even.pop(0)
                cnt -= 1
            else:
                if (len(even) < 2 and len(odd) >= 2):
                    res += odd[0] + odd[1]
                    odd.pop(0)
                    odd.pop(0)
                    cnt -= 2
                elif (len(odd) < 2 and len(even) >= 2):
                    res += even[0] + even[1]
                    even.pop(0)
                    even.pop(0)
                    cnt -= 2
                elif (len(even) >= 2 and len(odd) >= 2):
                    if (even[0] + even[1] > odd[0] + odd[1]):
                        res += even[0] + even[1]
                        even.pop(0)
                        even.pop(0)
                        cnt -= 2
                    else:
                        res += odd[0] + odd[1]
                        odd.pop(0)
                        odd.pop(0)
                        cnt -= 2
                else:
                    return 0
        return res
         