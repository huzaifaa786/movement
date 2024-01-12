import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class SaleController extends GetxController {
  static SaleController instance = Get.find();
  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ourdate = DateTime.now();
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  bool isOpen = false; // Add this property

  void open() {
    isOpen = true;
    update();
  }

  void close() {
    isOpen = false;
    update();
  }

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
    } else {}
    update();
  }
}
