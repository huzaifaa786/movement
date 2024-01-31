import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/helpers/loading.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController instance = Get.find();
  GetStorage box = GetStorage();

  TextEditingController emailController = TextEditingController();
  final authApi = UserApi();
  String language = 'english';

  Future<void> ForgetPasswordUser() async {
    if (emailController.text.isEmpty) {
      UiUtilites.errorSnackbar('please fill the email', 'error');
      return;
    }
    LoadingHelper.show();
    var response = await authApi.forgotPassword(emailController.text);
    LoadingHelper.dismiss();
    if (!response['error']) {
      Get.toNamed(AppRoutes.enterCode);

      UiUtilites.successSnackbar(
          'OTP has send to your email, please fill it', 'Success');
    } else {
      UiUtilites.errorSnackbar('Error', response['error_data'].toString());
    }
  }
}
