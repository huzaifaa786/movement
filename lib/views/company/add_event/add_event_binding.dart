import 'package:get/get.dart';
import 'package:noobz/views/company/add_event/add_event_controller.dart';
import 'package:noobz/views/company/add_payment/company_add_payment_controller.dart';
import 'package:noobz/views/company/auth/signup/company_signup_controller.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class CompanyAddEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyAddEventController());
  }
}
