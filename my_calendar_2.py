class MyCalendarTwo:
    def __init__(self):
        self.booked = []
        self.overlaps = []

    def book(self, start: int, end: int) -> bool:
        if any(s < end and start < e for s, e in self.overlaps):
            return False
        for s, e in self.booked:
            if s < end and start < e:
                self.overlaps.append((max(s, start), min(e, end)))
        self.booked.append((start, end))
        return True