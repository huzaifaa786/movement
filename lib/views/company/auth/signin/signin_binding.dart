import 'package:get/get.dart';
import 'package:noobz/views/company/auth/signin/signin_controller.dart';


class CompanySignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanySignInController());
  }
}
