import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class SignInController extends GetxController {
  static SignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  String language = 'english';
}
