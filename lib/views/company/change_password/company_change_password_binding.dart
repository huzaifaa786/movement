import 'package:get/get.dart';
import 'package:noobz/views/company/change_password/company_change_password_controller.dart';
import 'package:noobz/views/individual/change_password/change_password_controller.dart';

class CompanyChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyChangePasswordController());
  }
}