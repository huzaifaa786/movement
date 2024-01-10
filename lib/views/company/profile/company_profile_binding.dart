import 'package:get/get.dart';
import 'package:noobz/views/company/profile/company_profile_controller.dart';

class CompanyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyProfileController());
  }
}
