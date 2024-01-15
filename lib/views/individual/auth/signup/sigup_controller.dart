import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class SigUpController extends GetxController {
  static SigUpController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextPassword1 = true;
  final _authApi = UserApi();
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  void toggle1() {
    obscureTextPassword1 = !obscureTextPassword1;
    update();
  }

  String language = 'english';

  Future<void> registerUser() async {
    try {
      if (UsernameController.text.isEmpty ||
          EmailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        return;
      }

      var response = await _authApi.register(
        UsernameController.text,
        EmailController.text,
        passwordController.text,
      );

      if (response) {
      } else {}
    } catch (error) {
      
      print('Error registering user: $error');
    }
  }
}
