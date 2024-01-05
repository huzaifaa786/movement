import 'package:get/get.dart';
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
    
    Get.offNamed(AppRoutes.language); 
  }
}
