class Solution:
    def findRepeatedDnaSequences(self, s: str) -> List[str]:
        sequence_count = {}  # 创建一个哈希表来存储每个子序列的出现次数
        result = set()  # 创建一个集合来存储结果，以避免重复
        
        for i in range(len(s) - 9):  # 遍历字符串，每次取长度为 10 的子序列
            sequence = s[i:i+10]  # 获取子序列
            sequence_count[sequence] = sequence_count.get(sequence, 0) + 1  # 更新哈希表
            if sequence_count[sequence] == 2:  # 如果子序列出现次数变为 2，将其添加到结果集合中
                result.add(sequence)
                
        return list(result) 