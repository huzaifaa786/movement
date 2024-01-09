import 'package:get/get.dart';
import 'package:noobz/views/individual/home/Individual_home_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class IndividualHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndividualHomeController());
  }
}
