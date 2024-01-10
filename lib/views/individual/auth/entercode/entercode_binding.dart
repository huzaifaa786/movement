import 'package:get/get.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_controller.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class EnterCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterCodeController());
  }
}
