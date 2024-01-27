import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IndividualProfileController extends GetxController {
  static IndividualProfileController instance = Get.find();

  GetStorage box = GetStorage();
  String? name = '';
  String? email = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = box.read('name');
    email = box.read('email');
  }
}
