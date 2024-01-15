import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanyNotificationController extends GetxController {
  static CompanyNotificationController instance = Get.find();

      var items = List.generate(10, (index) => 'Item $index').obs;

}
