import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noobz/api/company_logo_auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanyProfileController extends GetxController {
  static CompanyProfileController instance = Get.find();

  String? imageUrl = '';
  String? userName = '';
  String? userEmail = '';
  GetStorage box = GetStorage();

  getUserData() async {
    userName = await box.read('user_name');
    imageUrl = await box.read('user_image');
    userEmail = await box.read('user_email');
    print(userName);
    print(imageUrl);
    print(userEmail);
    update();
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
