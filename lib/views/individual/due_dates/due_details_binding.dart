import 'package:get/get.dart';
import 'package:noobz/views/individual/due_dates/due_details_controller.dart';

class DueDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DueDetailsController());
  }
}
