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
    if (authCheck != null) {
      Get.offNamed(AppRoutes.signIn);
      print('1');
    } else {
      print('2');
      Get.offNamed(AppRoutes.calenderscreen);
    }
  }
}
