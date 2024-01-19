import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CompanyAddPaymentController extends GetxController {
  static CompanyAddPaymentController instance = Get.find();
  RxInt selectedOption = 1.obs;
  List<String> paymentDates = ['Manually', 'automatic'];
   String selectedPaymentDateType = '';

  void setSelectedOption(int? value) {
    selectedOption.value = value ?? 1;
    update();
  }

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
