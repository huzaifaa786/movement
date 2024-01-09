import 'package:get/get.dart';
import 'package:noobz/views/auth/sigin/signin_controller.dart';
import 'package:noobz/views/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
