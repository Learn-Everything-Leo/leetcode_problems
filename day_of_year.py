class Solution:
    def dayOfYear(self, date: str) -> int:
        year, month, day = [int(x) for x in date.split("-")]

        amount = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if year % 400 == 0 or (year % 4 == 0 and year % 100 != 0):
            amount[1] += 1

        ans = sum(amount[:month - 1])
        return ans + day
