import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/api/company_auth_api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/routes/app_routes.dart';

class CompanySignInController extends GetxController {
  static CompanySignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final comapnyauth = ComapnyAuthApi();
  User? user;

  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  String language = 'english';

  Future<void> companyLoginUser() async {

    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      var responce = await comapnyauth.companylogin(
          emailController.text, passwordController.text);
      if (!responce['error']) {

        Get.offNamed(AppRoutes.individualHome);
        user = User.fromJson(responce['user']);
      } else {

        print(responce['error_data']);
      }
    } catch (error) {}
  }
}
