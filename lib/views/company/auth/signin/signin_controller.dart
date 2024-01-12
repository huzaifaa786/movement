import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySignInController extends GetxController {
  static CompanySignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  String language = 'english';
}
