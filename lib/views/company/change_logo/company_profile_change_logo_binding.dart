import 'package:get/get.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_controller.dart';


class CompanyProfileChangelogoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyProfileChangelogocontroller());
  }
}
