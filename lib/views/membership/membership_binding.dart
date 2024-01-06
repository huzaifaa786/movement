import 'package:get/get.dart';
import 'package:noobz/views/membership/membership_controller.dart';

class MemberShipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MembershipController());
  }
}
