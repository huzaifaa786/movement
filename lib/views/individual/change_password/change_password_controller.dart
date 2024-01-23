import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/api/auth_api.dart';

import 'package:noobz/api/company_auth_api.dart';
import 'package:noobz/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController instance = Get.find();
  //String? api_token = '';

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final authApi = UserApi();
  Future<void> changePasswordUser() async {
    if (oldPasswordController.text.isEmpty ||
        newPasswordcontroller.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return;
    }

    if (newPasswordcontroller.text != confirmPasswordController.text) {
      return;
    }

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // api_token = preferences.getString('api_token');
    
    GetStorage box = GetStorage();
    String? authCheck = await box.read('api_token');

    if (authCheck != null) {
      print('api token exists');
    }

    var response = await authApi.changePassword(
      oldPasswordController.text,
      newPasswordcontroller.text,
      // api_token ?? '',
      authCheck.toString(),
    );

    if (!response['error']) {
      print('Password changed successfully');
    } else {
      print('Password change failed');
    }
  }
}
