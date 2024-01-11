import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanySignUPController extends GetxController {
  static CompanySignUPController instance = Get.find();
   TextEditingController passwordController = TextEditingController();
  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
}
}
