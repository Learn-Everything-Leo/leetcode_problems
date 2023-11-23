class Solution:
    def entityParser(self, text: str) -> str:
        entityMap = {
            '&quot;': '"',
            '&apos;': "'",
            '&gt;': '>',
            '&lt;': '<',
            '&frasl;': '/',
            '&amp;': '&',
        }

        i = 0
        n = len(text)
        res = []
        while i < n:
            isEntity = False
            if text[i] == '&':
                for e in entityMap:
                    if text[i:i + len(e)] == e:
                        res.append(entityMap[e])
                        isEntity = True
                        i += len(e)
                        break
            if not isEntity:
                res.append(text[i])
                i += 1
        return ''.join(res)