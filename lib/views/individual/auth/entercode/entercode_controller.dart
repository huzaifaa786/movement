import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class EnterCodeController extends GetxController {
  static EnterCodeController instance = Get.find();
  GetStorage box = GetStorage();

  bool isCodeEntered = false;
  // bool isotp = false;
  final authApi = UserApi();
  String otp = '';

  String language = 'english';

  updateEnterCode() {
    isCodeEntered = true;
    update();
  }

  verifyOtp() async {
    var response = await authApi.verifyOtp(otp);
    if (!response['error']) {
      Get.toNamed(AppRoutes.individualHome);
    } else {
      UiUtilites.errorSnackbar('Error', response['error_data']);
    }
  }
}
