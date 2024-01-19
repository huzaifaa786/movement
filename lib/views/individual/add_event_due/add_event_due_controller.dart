import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/event_api.dart';
import 'package:noobz/helpers/date_helper.dart';
import 'package:noobz/utils/ui_utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AddEventDueController extends GetxController {
  static AddEventDueController instance = Get.find();
  GetStorage box = GetStorage();

  RxInt selectedOption = 1.obs;
  final TextEditingController eventController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noOfDayMonthsController = TextEditingController();
  final TextEditingController noOfWeekMonthsController =
      TextEditingController();
  final TextEditingController noOfMonthYearsController =
      TextEditingController();
  final DateHelper dateHelper = DateHelper();
  List<String> reminderOptions = ['Day', 'Weekly', 'Monthly'];
  List<String> paymentDates = ['Manually', 'automatic'];
  List<String> eventTypes = ['Paid', 'other'];
  List<String> weekdays = ["S", "M", "T", "W", "TH", "F", "SA"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String selectedReminder = '';
  String selectedWeekDay = '';
  String selectedMonth = '';
  String selectedDayDate = '';
  String selectedEventType = '';
  String selectedPaymentDateType = '';
  List<String> dailyMonths = [];
  List<String> weeklyMonths = [];
  List<String> monthlyYears = [];
  int noOfDayMonths = 1;
  int noOfWeekMonths = 1;
  int noOfMonthYears = 1;

  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ournewdate = DateTime.now().add(Duration(hours: 30));
  DateTime newtoday = DateTime.now().add(Duration(hours: 30));
  EventApi eventApi = new EventApi();

  @override
  void onInit() {
    selectedReminder = reminderOptions.first;
    selectedWeekDay = weekdays.first;
    selectedMonth = months.first;
    selectedPaymentDateType = paymentDates.first;
    selectedEventType = eventTypes.first;
    selectedDayDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(Duration(hours: 30)));
    noOfDayMonthsController.text = noOfDayMonths.toString();
    noOfWeekMonthsController.text = noOfWeekMonths.toString();
    noOfMonthYearsController.text = noOfMonthYears.toString();
    getFutureDates(selectedWeekDay, noOfWeekMonths);
    getFutureDatesFromDate(selectedDayDate, noOfDayMonths);
    getFutureYear(selectedMonth, noOfMonthYears);
    super.onInit();
  }

  submit() {
    if (validateReminder()) {
      List<String> schedules = [];
      if (selectedReminder == reminderOptions.first) {
        if (selectedPaymentDateType == paymentDates[1]) {
          schedules = dailyMonths;
        } else {
          schedules.add(selectedDayDate);
        }
      } else if (selectedReminder == reminderOptions[1]) {
        schedules = weeklyMonths;
      } else if (selectedReminder == reminderOptions[2]) {
        schedules = monthlyYears;
      }

      eventApi.storeEvent(
        event_name: eventController.text,
        event_type: selectedEventType == eventTypes.first ? 'yes' : 'no',
        payment_amount:
            selectedEventType == eventTypes.first ? amountController.text : '',
        payment_type: selectedEventType == eventTypes.first ? 'other' : '',
        schedule: schedules,
      );
      resetFields();
    } else {}
  }

  resetFields() {
    eventController.text = '';
    amountController.text = '';
    noOfDayMonthsController.text = '1';
    noOfWeekMonthsController.text = '1';
    noOfMonthYearsController.text = '1';
    selectedReminder = reminderOptions.first;
    selectedWeekDay = weekdays.first;
    selectedMonth = months.first;
    selectedDayDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(Duration(hours: 30)));
    selectedEventType = eventTypes.first;
    selectedPaymentDateType = paymentDates.first;
    dailyMonths.clear();
    weeklyMonths.clear();
    monthlyYears.clear();
    noOfDayMonths = 1;
    noOfWeekMonths = 1;
    noOfMonthYears = 1;
    update();
  }

  // get daily date string list
  getFutureDatesFromDate(String startDate, int numberOfMonths) async {
    dailyMonths =
        await dateHelper.getFutureDatesFromDate(startDate, numberOfMonths);
    update();
  }

  // get weekly date string list
  getFutureDates(String dayOfWeek, int numberOfMonths) async {
    weeklyMonths =
        await dateHelper.getDatesByDayOfWeek(dayOfWeek, numberOfMonths);
    update();
  }

  // get years string list
  getFutureYear(String monthName, int numberOfYears) async {
    monthlyYears = await dateHelper.getFutureYears(monthName, numberOfYears);
    update();
  }

  removeDailyMonths(index) async {
    dailyMonths.removeAt(index);
    noOfDayMonths = dailyMonths.length;
    noOfDayMonthsController.text = noOfDayMonths.toString();
    update();
    Get.back();
  }

  removeWeeklyMonths(index) async {
    weeklyMonths.removeAt(index);
    noOfWeekMonths = weeklyMonths.length;
    noOfWeekMonthsController.text = noOfWeekMonths.toString();
    update();
    Get.back();
  }

  removeYearly(index) async {
    monthlyYears.removeAt(index);
    noOfMonthYears = monthlyYears.length;
    noOfMonthYearsController.text = noOfMonthYears.toString();
    update();
    Get.back();
  }

  void onFormatChanged(DateTime date) {
    newtoday = date;
    ournewdate = date;
    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    newtoday = day;
    ournewdate = day;
    selectedDayDate = DateFormat('yyyy-MM-dd').format(day);
    getFutureDatesFromDate(selectedDayDate, noOfDayMonths);
    update();
  }

  bool validateReminder() {
    String? errorMessage;

    // Validate event name
    if (eventController.text.isEmpty) {
      errorMessage = "Please enter an event name";
    }

    // Validate reminder pattern
    if (selectedReminder.isEmpty) {
      errorMessage = "Please select a reminder pattern";
    }

    // Validate date selection based on reminder pattern
    if (selectedReminder == reminderOptions.first) {
      if (selectedDayDate.isEmpty) {
        errorMessage = "Please select a date for the event";
      } else if (selectedPaymentDateType == paymentDates[1]) {
        if (dailyMonths.isEmpty) {
          errorMessage = "Atleast one date is required for the event";
        }
      }
    } else if (selectedReminder == reminderOptions[1]) {
      if (selectedWeekDay.isEmpty) {
        errorMessage = "Please select a weekday for the weekly events";
      } else if (weeklyMonths.isEmpty) {
        errorMessage = "Atleast one date is required for the event";
      }
    } else if (selectedReminder == reminderOptions[2]) {
      if (selectedMonth.isEmpty) {
        errorMessage = "Please select a month for the monthly events";
      } else if (monthlyYears.isEmpty) {
        errorMessage = "Atleast one date is required for the event";
      }
    }

    // Validate payment due selection
    if (selectedEventType.isEmpty) {
      errorMessage = "Please select whether there's a payment due";
    } else if (selectedEventType == eventTypes.first &&
        amountController.text.isEmpty) {
      errorMessage = "Please enter the payment amount";
    }

    // Display error message or proceed
    if (errorMessage != null) {
      UiUtilites.errorSnackbar('Validation Error', errorMessage);
      return false;
    } else {
      return true;
    }
  }
}
