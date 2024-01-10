import 'package:get/get.dart';
import 'package:noobz/views/individual/auth/sigin/signin_controller.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class WithOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithOtpController());
  }
}
