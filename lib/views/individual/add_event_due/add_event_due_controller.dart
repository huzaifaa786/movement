import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class AddEventDueController extends GetxController {
  static AddEventDueController instance = Get.find();
  GetStorage box = GetStorage();

  RxInt selectedOption = 1.obs;

  void setSelectedOption(int? value) {
    selectedOption.value = value ?? 1;
    update();
  }

  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ournewdate = DateTime.now();
  DateTime newtoday = DateTime.now();
  DateTime? newrangeStart;
  DateTime? newrangeEnd;

  void onFormatChanged(DateTime date) {
    newtoday = date;
    ournewdate = date;

    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    newtoday = day;
    ournewdate = day;

    update();
  }

  void onRangeSelected(start, end, focusedDay) {
    newrangeStart = start;
    newrangeEnd = end;
    newtoday = focusedDay;
    ournewdate = focusedDay;
    if (end == null) {
    } else {}
    update();
  }
}
