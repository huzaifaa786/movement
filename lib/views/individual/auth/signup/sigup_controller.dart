import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class SigUpController extends GetxController {
  static SigUpController instance = Get.find();
  GetStorage box = GetStorage();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextPassword1 = true;

  User? user;
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

      var responce = await _authApi.register(
        UsernameController.text,
        EmailController.text,
        passwordController.text,
      );
      if (!responce['error']) {
        print('dddddddddddd');
        user = User.fromJson(responce['user']);
        print(user);
        UiUtilites.successSnackbar('SignUp successfully.', 'Success!');
        box.write('api_token', user!.api_token);
        print(box);
        log('dffffffffffffffffffffffffffffffffffffffffffffffffff');
        clearFields();
        Get.offNamed(AppRoutes.individualHome);
      } else {
        print(responce['error_data']);
      }
    } catch (error) {
      print('Error registering user: $error');
    }
  }

  void clearFields() {
    passwordController.clear();
    confirmPasswordController.clear();
    UsernameController.clear();
    EmailController.clear();

    update();
  }
}
