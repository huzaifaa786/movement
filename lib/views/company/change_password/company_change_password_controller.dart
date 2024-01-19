import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noobz/api/company_auth_api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyChangePasswordController extends GetxController {
  static CompanyChangePasswordController instance = Get.find();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final comapnyauth = ComapnyAuthApi();

  Future<void> changePasswordUser() async {
<<<<<<< HEAD
  try {
    if (
        oldPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        confirmPassword.text.isEmpty
        ) {
      return;
    }
=======
    try {
      if (oldPassword.text.isEmpty ||
          newPassword.text.isEmpty ||
          confirmPassword.text.isEmpty) {
        print("text fields are empty");
        return;
      }
>>>>>>> 24747830c7c6858ff7fcf1f96fc189880d0ba9b0

      if (newPassword.text != confirmPassword.text) {
        print("New Password and Confirm New Password do not match");
        return;
      }
        User? user;

<<<<<<< HEAD
    var response = await comapnyauth.changePassword(
      oldPassword.text,
      newPassword.text,
      confirmPassword.text,

    );
=======
  //  user = User.fromJson(responce['user']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? apiToken = prefs.getString('api_token');
>>>>>>> 24747830c7c6858ff7fcf1f96fc189880d0ba9b0

      if (apiToken == null) {
        print("API token not found");
        return;
      }

      print('API Token:');
      print(apiToken);

      var response = await comapnyauth.changePassword(
          oldPassword.text, newPassword.text, apiToken ?? '');
      print('objectssssssssssssssssssssssssssssssssssss');
      if (!response['error']) {
        print("Password changed successfully");
      } else {
        print(response['error_data']);
      }
    } catch (error) {
      // Handle any error that occurs during the password change process.
    }
  }
}
