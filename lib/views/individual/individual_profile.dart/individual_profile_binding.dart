import 'package:get/get.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_controller.dart';

class IndividualProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndividualProfileController());
  }
}