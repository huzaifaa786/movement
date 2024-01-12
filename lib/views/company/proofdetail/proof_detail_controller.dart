import 'package:get/get.dart';
import 'package:noobz/utils/ui_utils.dart';

class ProofDetailController extends GetxController {
  static ProofDetailController instance = Get.find();

  var isAccepted = false.obs;
  var isRejected = false.obs;

  void accept() {
    isAccepted.value = true;
    isRejected.value = false;
    update();
  }

  void reject() {
    isAccepted.value = false;
    isRejected.value = true;
    update();
  }
}
