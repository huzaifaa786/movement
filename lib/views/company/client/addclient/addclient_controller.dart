import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClientController extends GetxController {
  static AddClientController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextPassword1 = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  void toggle1() {
    obscureTextPassword1 = !obscureTextPassword1;
    update();
  }

  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime Ourdate = DateTime.now();
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;
  int price = 0;

  void onFormatChanged(DateTime date) {
    today = date;
    Ourdate = date;

    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    today = day;
    Ourdate = day;
    rangeStart = null;
    rangeEnd = null;

    update();
  }
}
