class Solution {
  DateTime parseDate(String date) {
    return DateTime(2023, int.tryParse(date.substring(0, 2)) ?? 0,
        int.tryParse(date.substring(3, 5)) ?? 0);
  }

  int countDaysTogether(String arriveAlice, String leaveAlice, String arriveBob,
      String leaveBob) {
    DateTime arriveAliceDate = parseDate(arriveAlice);
    DateTime leaveAliceDate = parseDate(leaveAlice);
    DateTime arriveBobDate = parseDate(arriveBob);
    DateTime leaveBobDate = parseDate(leaveBob);

    if (arriveAliceDate.compareTo(leaveBobDate) > 0 ||
        arriveBobDate.compareTo(leaveAliceDate) > 0) {
      return 0;
    }

    List<DateTime> dateList = [
      arriveAliceDate,
      leaveAliceDate,
      arriveBobDate,
      leaveBobDate
    ];
    dateList.sort();
    return dateList[2].difference(dateList[1]).inDays + 1;
  }
}
