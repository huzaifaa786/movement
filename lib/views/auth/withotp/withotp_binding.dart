import 'package:get/get.dart';
import 'package:noobz/views/auth/sigin/signin_controller.dart';
import 'package:noobz/views/auth/signup/sigup_controller.dart';
import 'package:noobz/views/auth/withotp/withotp_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class WithOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithOtpController());
  }
}
