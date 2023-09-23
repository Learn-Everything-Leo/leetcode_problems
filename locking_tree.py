class LockingTree:

    def __init__(self, parent: List[int]):
        self.parent = parent
        self.status = [-1] * len(parent)
        self.children = [[] for _ in range(len(parent))]
        for node, p in enumerate(parent):
            if p != -1:
                self.children[p].append(node)

    def lock(self, num: int, user: int) -> bool:
        if self.status[num] == -1:
            self.status[num] = user
            return True
        else:
            return False

    def unlock(self, num: int, user: int) -> bool:
        if self.status[num] == user:
            self.status[num] = -1
            return True
        else:
            return False


    def upgrade(self, num: int, user: int) -> bool:
        if (self.status[num] == -1) and (not self.checkParent(num)) and (self.checkAndUnlockChildren(num)):
            self.status[num] = user
            return True
        else:
            return False

    def checkParent(self, num: int) -> bool:
        num = self.parent[num]
        while num != -1:
            if self.status[num] != -1:
                return True
            num = self.parent[num]
        return False
    
    def checkAndUnlockChildren(self, num: int) -> bool:
        res = self.status[num] != -1
        self.status[num] = -1
        for child in self.children[num]:
            res |= self.checkAndUnlockChildren(child)
        return res

    



# Your LockingTree object will be instantiated and called as such:
# obj = LockingTree(parent)
# param_1 = obj.lock(num,user)
# param_2 = obj.unlock(num,user)
# param_3 = obj.upgrade(num,user)