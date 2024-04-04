class Solution:
    def getAncestors(self, n: int, edges: List[List[int]]) -> List[List[int]]:
        anc = [set() for _ in range(n)]   # 存储每个节点祖先的辅助数组
        e = [[] for _ in range(n)] # 邻接表
        indeg = [0] * n   # 入度表
        # 预处理
        for u, v in edges:
            e[u].append(v)
            indeg[v] += 1
        # 广度优先搜索求解拓扑排序
        q = deque()
        for i in range(n):
            if indeg[i] == 0:
                q.append(i)
        while q:
            u = q.popleft()
            for v in e[u]:
                # 更新子节点的祖先哈希表
                anc[v].add(u)
                anc[v].update(anc[u])
                indeg[v] -= 1
                if indeg[v] == 0:
                    q.append(v)
        # 转化为答案数组
        res = [sorted(anc[i]) for i in range(n)]        
        return res
