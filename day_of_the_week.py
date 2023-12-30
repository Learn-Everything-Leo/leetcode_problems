import datetime


class Solution:
    def dayOfTheWeek(self, day: int, month: int, year: int) -> str:
        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        date = datetime.datetime(year, month, day)
        return days[date.weekday()]