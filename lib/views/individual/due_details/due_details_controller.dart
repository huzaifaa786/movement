import 'package:get/get.dart';

class DueDetailsController extends GetxController {
  static DueDetailsController instance = Get.find();

  String? trackingNumber = '';
  String? typeOfService = '';
  String? dueDate = '';
  String? amount = '';
  String? status = '';
  String? user_name = '';

  @override
  void onInit() {
    super.onInit();
    trackingNumber = Get.parameters['tracking_number'];
    typeOfService = Get.parameters['type_of_service'];
    dueDate = Get.parameters['event_date'];
    amount = Get.parameters['amount'];
    status = Get.parameters['status'];
    user_name = Get.parameters['user_name'];
    update();
  }
}
