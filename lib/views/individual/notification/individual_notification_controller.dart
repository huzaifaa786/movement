import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class IndividualNotificationController extends GetxController {
  static IndividualNotificationController instance = Get.find();
    var items = List.generate(10, (index) => 'Item $index').obs;

}
