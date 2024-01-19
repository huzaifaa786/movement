import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/ui_utils.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
      update();
    });
  }

  Future checkFirstSeen() async {
    GetStorage box = await GetStorage();
    String? api_token = await box.read('api_token');
    log('gggggggggggggggggggggggggggggggggggggg');
    print(api_token);

    if (api_token == null) {
      Get.offNamed(AppRoutes.signUp);
    } else {
      Get.offNamed(AppRoutes.individualHome);
    }
  }
}
