import 'package:get/get.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_controller.dart';
import 'package:noobz/views/auth/sigin/signin_controller.dart';
import 'package:noobz/views/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
