import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';

import 'package:noobz/helpers/loading.dart';
import 'package:noobz/utils/ui_utils.dart';

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

    GetStorage box = GetStorage();
    String? authCheck = await box.read('api_token');

    if (authCheck != null) {
      print('api token exists');
    }
    LoadingHelper.show();
    var response = await authApi.changePassword(
      oldPasswordController.text,
      newPasswordcontroller.text,
      // api_token ?? '',
      authCheck.toString(),
    );
    LoadingHelper.dismiss();
    if (!response['error']) {
      Get.back();
      UiUtilites.successSnackbar('password updated successfully', 'Success!');
    } else {
      UiUtilites.errorSnackbar('could not update password', 'Error!');
    }
  }
}
