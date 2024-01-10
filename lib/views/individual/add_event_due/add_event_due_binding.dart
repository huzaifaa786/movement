import 'package:get/get.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_controller.dart';

class AddEventDueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEventDueController());
  }
}
