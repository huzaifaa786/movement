import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class SigUpController extends GetxController {
  static SigUpController instance = Get.find();
   TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
   String language = 'english';
}
