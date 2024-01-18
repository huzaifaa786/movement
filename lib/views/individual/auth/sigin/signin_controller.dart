import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class SignInController extends GetxController {
  static SignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool obscureTextPassword = true;
  final _authApi = UserApi();
  User? user;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  String language = 'english';
  Future<void> LoginUser() async {
    // try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      var responce =
          await _authApi.login(emailController.text, passwordController.text);
      if (!responce['error']) {
        Get.offNamed(AppRoutes.individualHome);
        user = User.fromJson(responce['user']);
      } else {
        print(responce['error_data']);
      }
    // }
    //  catch (error) {}
  }
}
