import collections


class FrontMiddleBackQueue:

    def __init__(self):
        self.left = collections.deque()
        self.right = collections.deque()

    def pushFront(self, val: int) -> None:
        self.left.appendleft(val)
        if len(self.left) == len(self.right) + 2:
            self.right.appendleft(self.left.pop())

    def pushMiddle(self, val: int) -> None:
        if len(self.left) == len(self.right) + 1:
            self.right.appendleft(self.left.pop())
        self.left.append(val)

    def pushBack(self, val: int) -> None:
        self.right.append(val)
        if len(self.left) + 1 == len(self.right):
            self.left.append(self.right.popleft())

    def popFront(self) -> int:
        if len(self.left) == 0:
            return -1
        val = self.left.popleft()
        if len(self.left) + 1 == len(self.right):
            self.left.append(self.right.popleft())
        return val

    def popMiddle(self) -> int:
        if len(self.left) == 0:
            return -1
        val = self.left.pop()
        if len(self.left) + 1 == len(self.right):
            self.left.append(self.right.popleft())
        return val

    def popBack(self) -> int:
        if len(self.left) == 0:
            return -1
        val = 0
        if len(self.right) == 0:
            val = self.left.pop()
        else:
            val = self.right.pop()
            if len(self.left) == len(self.right) + 2:
                self.right.appendleft(self.left.pop())
        return val