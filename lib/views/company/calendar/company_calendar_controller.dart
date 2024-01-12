import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CompanyCalendarController extends GetxController {
  static CompanyCalendarController instance = Get.find();

    CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ourdate = DateTime.now();
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void onFormatChanged(DateTime date) {
    today = date;
    ourdate = date;

    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    today = day;
    ourdate = day;
  
    update();
  }

  void onRangeSelected(start, end, focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    today = focusedDay;
    ourdate = focusedDay;
    if (end == null) {
   
    } else {
    
    }
    update();
  }
}
