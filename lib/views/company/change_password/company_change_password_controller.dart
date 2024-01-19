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
    try {
      if (oldPassword.text.isEmpty ||
          newPassword.text.isEmpty ||
          confirmPassword.text.isEmpty) {
        print("text fields are empty");
        return;
      }

      if (newPassword.text != confirmPassword.text) {
        print("New Password and Confirm New Password do not match");
        return;
      }

      String apiToken = '';

      var response = await comapnyauth.changePassword(
          oldPassword.text, newPassword.text, apiToken );
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
