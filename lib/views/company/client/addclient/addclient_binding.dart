import 'package:get/get.dart';
import 'package:noobz/views/company/client/addclient/addclient_controller.dart';

class AddClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddClientController());
  }
}