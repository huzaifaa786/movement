import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/auth_api.dart';

class CompanySignInController extends GetxController {
  static CompanySignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final authapi = UserApi();

  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  String language = 'english';

  Future<void> companyloginUser() async {
    // try {
    //   print('objectllllllllllllllllllllllllllllllllll');

    //   if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    //     return;
    //   }
    //   print('objectllllllllllllllllllllllllllllllllll');
    //   var response = await authapi.login(
    //     emailController.text,
    //     passwordController.text,
    //   );

    //   if (response) {
    //     print('Login successful');
    //     // Add your logic here for what to do after a successful login
    //   } else {
    //     // Login failed
    //     print('Login nottttttttttttt successful');

    //     // Add your logic here for what to do when login fails
    //   }
    // } catch (error) {
    //   print('Error logging in: $error');
    // }
  }
}
