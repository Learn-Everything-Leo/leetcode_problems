from collections import defaultdict


class Solution:
    def count(self, word: str, k:int) -> int:
        vowels = "aeiou"
        cnt1 = defaultdict(int)
        cnt2 = 0
        res = left = 0
        for c in word:
            if (c in vowels):
                cnt1[c] += 1
            else:
                cnt2 += 1
            while len(cnt1) == 5 and cnt2 >= k:
                out = word[left]
                if out in vowels:
                    cnt1[out] -= 1
                    if cnt1[out] == 0:
                        del cnt1[out]
                else:
                    cnt2 -= 1
                left += 1
            res += left
        return res        
    
    def countOfSubstrings(self, word: str, k: int) -> int:
        return self.count(word, k) - self.count(word, k + 1)