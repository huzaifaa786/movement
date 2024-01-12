import 'package:get/get.dart';
import 'package:noobz/views/company/addnotification/addnotification.controller.dart';

class AddNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNotificationController());
  }
}