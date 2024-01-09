import 'package:get/get.dart';
import 'package:noobz/views/company/client/allclient/allclient_controller.dart';

class AllClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllClientController());
  }
}
