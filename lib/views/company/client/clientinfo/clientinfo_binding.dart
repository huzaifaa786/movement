import 'package:get/get.dart';
import 'package:noobz/views/company/client/clientinfo/clientinfo_controller.dart';

class ClientInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientinfoController());
  }
}
