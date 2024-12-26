class Solution:
    def isSubstringPresent(self, s: str) -> bool:
        subList = []
        for i in range(len(s) - 1):
            subList.append(s[i:i+2])
        reversedStr = s[::-1]
        for i in range(len(reversedStr) - 1):
            if reversedStr[i:i+2] in subList:
                return True
        return False
