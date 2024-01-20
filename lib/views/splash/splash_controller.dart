import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
      update();
    });
  }

  Future checkFirstSeen() async {
    GetStorage box = GetStorage();

    String? authCheck = await box.read('api_token');
    print(authCheck);
    print('ggggggggggggggggggggggggggggggggggggggg');
    print(box.read('api_token'));
    if (authCheck != null) {
      Get.offNamed(AppRoutes.individualHome);
    } else {
      Get.offNamed(AppRoutes.signIn);
    }
  }
}
