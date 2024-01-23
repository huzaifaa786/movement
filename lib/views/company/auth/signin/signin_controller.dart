import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/api/company_auth_api.dart';
import 'package:noobz/models/company_model.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanySignInController extends GetxController {
  static CompanySignInController instance = Get.find();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final comapnyauth = ComapnyAuthApi();
  // User? user;
  CompanyUser? compnyuser;
  GetStorage box = GetStorage();
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
      print('response a gya haaaaaaa');
      if (!responce['error']) {
        print('Login  successful');

        compnyuser = CompanyUser.fromJson(responce['company']);
        print(compnyuser);
        UiUtilites.successSnackbar('Sigin successfully.', 'Success!');
        box.write('api_token', compnyuser!.api_token);
        print(box);

        Get.offAllNamed(AppRoutes.companyhome);
      } else {
        print('Login  not successful');
        print(responce['error_data']);
      }
    } catch (error) {}
  }
}
