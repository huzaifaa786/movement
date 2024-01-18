import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/api/client_api.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClientController extends GetxController {
  static AddClientController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController unitNameController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController unitTypeController = TextEditingController();
  

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

  RxInt selectedOption = 1.obs;

  void setSelectedOption(int? value) {
    selectedOption.value = value ?? 1;
    update();
  }

  final _clientApi = ClientApi();
  Future<void> addClientUser() async {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    try {
      if (userNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty ||
          paymentController.text.isEmpty ||
          priceController.text.isEmpty ||
          dateController.text.isEmpty ||
          unitNameController.text.isEmpty ||
          unitNumberController.text.isEmpty ||
          unitTypeController.text.isEmpty) {
        return;
      }

      var response = await _clientApi.addClient(
        userNameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        paymentController.text,
        priceController.text,
        dateController.text,
        unitNameController.text,
        unitNumberController.text,
        unitTypeController.text,
      );

      if (!response['error']) {
        print('i am here');
      } else {
        print('responce have error');
      }
    } catch (error) {
      print('Error registering user: $error');
    }
  }
}
