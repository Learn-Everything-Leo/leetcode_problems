class Solution:
    def countVowelSubstrings(self, word: str) -> int:
        n = len(word)
        res = 0
        vowelset = set("aeiou")   # 所有元音对应的哈希集合
        for i in range(n):
            # 枚举左端点
            charset = set()   # 子串对应的哈希集合
            for j in range(i, n):
                # 按顺序枚举右端点并更新子串哈希集合及比较
                charset.add(word[j])
                if charset == vowelset:
                    res += 1
        return res
