import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanySignUPController extends GetxController {
  static CompanySignUPController instance = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authApi = UserApi();

  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  Future<void> companyregisterUser() async {
    try {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        return;
      }
      var response = await authApi.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );

      if (response) {
      } else {}
    } catch (error) {
      print('Error registering user: $error');
    }
  }
}
