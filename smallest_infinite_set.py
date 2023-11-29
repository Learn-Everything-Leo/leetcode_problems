from sortedcontainers import SortedSet

class SmallestInfiniteSet:
    def __init__(self):
        self.thres = 1
        self.s = SortedSet()

    def popSmallest(self) -> int:
        s_ = self.s

        if not s_:
            ans = self.thres
            self.thres += 1
            return ans
        
        ans = s_[0]
        s_.pop(0)
        return ans

    def addBack(self, num: int) -> None:
        s_ = self.s

        if num < self.thres:
            s_.add(num)
