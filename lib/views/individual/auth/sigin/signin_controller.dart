import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class SignInController extends GetxController {
  static SignInController instance = Get.find();
  GetStorage box = GetStorage();
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
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      var responce =
          await _authApi.login(emailController.text, passwordController.text);
      if (!responce['error']) {
        print('dddddddddddd');
        user = User.fromJson(responce['user']);
        print(user);
        UiUtilites.successSnackbar('Sigin successfully.', 'Success!');
        box.write('api_token', user!.api_token);
        print(box);

        Get.offNamed(AppRoutes.individualHome);
      } else {
        print(responce['error_data']);
      }
    } catch (error) {}
  }
}
