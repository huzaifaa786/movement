import 'package:get/get.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_controller.dart';
import 'package:noobz/views/individual/auth/sigin/signin_controller.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
