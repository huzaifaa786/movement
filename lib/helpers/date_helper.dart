import 'package:intl/intl.dart';

class DateHelper {
  List<String> getDatesByDayOfWeek(String dayOfWeek, int numberOfMonths) {
    List<String> futureDates = [];
    DateTime now = DateTime.now();
    int targetDayOfWeekIndex = _getDayOfWeekIndex(dayOfWeek);
    DateTime startDate = DateTime(now.year, now.month, now.day);
    DateTime endDate = _addMonths(startDate, numberOfMonths);
    ;

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(Duration(days: 1))) {
      if (date.weekday == targetDayOfWeekIndex) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        futureDates.add(formattedDate);
      }
    }
    print(futureDates.length);
    return futureDates;
  }

  List<String> getFutureDatesFromDate(String startDate, int numberOfMonths) {
    List<String> futureDates = [];
    DateTime currentDate = DateTime.parse(startDate);
   

    // Generate future dates for the specified number of months
    for (int i = 0; i < numberOfMonths; i++) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      futureDates.add(formattedDate);
      // Move to the next month
      currentDate =
          DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
          
    }
 
    return futureDates;
  }

  List<String> getFutureYears(String monthName, int numberOfYears) {
    List<String> futureDates = [];
    DateTime now = DateTime.now();

    // Find the next occurrence of the specified month
    int currentMonth = now.month;
    int targetMonth = _getMonthIndex(monthName);
    print(targetMonth);

    int monthsUntilNextMonth = (targetMonth - currentMonth + 12) % 12;

    DateTime nextDate = DateTime(now.year, now.month + monthsUntilNextMonth, 1);

    // Generate future dates for the specified number of years
    for (int i = 0; i < numberOfYears; i++) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(nextDate);
      futureDates.add(formattedDate);

      // Move to the next year
      nextDate = DateTime(nextDate.year + 1, nextDate.month, 1);
    }

    return futureDates;
  }

  int _getMonthIndex(String monthName) {
    DateFormat format = DateFormat('MMM');
    DateTime date = format.parse(monthName);
    return date.month;
  }

  int _getDayOfWeekIndex(String dayOfWeek) {
    switch (dayOfWeek.toUpperCase()) {
      case 'M':
        return DateTime.monday;
      case 'T':
        return DateTime.tuesday;
      case 'W':
        return DateTime.wednesday;
      case 'TH':
        return DateTime.thursday;
      case 'F':
        return DateTime.friday;
      case 'SA':
        return DateTime.saturday;
      case 'S':
        return DateTime.sunday;
      default:
        throw Exception('Invalid day of week: $dayOfWeek');
    }
  }

  DateTime _addMonths(DateTime date, int months) {
    int year = date.year + (date.month + months) ~/ 12;
    int month = (date.month + months) % 12;
    int day = date.day;
    int hour = date.hour;
    int minute = date.minute;
    int second = date.second;
    int millisecond = date.millisecond;
    int microsecond = date.microsecond;

    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }
}
