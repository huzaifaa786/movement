import 'package:get/get.dart';
import 'package:noobz/views/company/home/company_home_controller.dart';


class CompanyHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyHomeController());
  }
}
