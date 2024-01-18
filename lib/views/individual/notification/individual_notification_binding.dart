import 'package:get/get.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_controller.dart';
import 'package:noobz/views/individual/home/Individual_home_controller.dart';
import 'package:noobz/views/individual/notification/individual_notification_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class IndividualNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndividualNotificationController());
  }
}