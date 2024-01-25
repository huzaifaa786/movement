import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noobz/api/company_logo_auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanyProfileChangelogocontroller extends GetxController {
  static CompanyProfileChangelogocontroller instance = Get.find();

  final companyauthlogoApi = ComapnyAuthLogoApi();

  XFile? logoImage;

  Future<void> selectlogoImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      logoImage = image;
      update();
    } else {
      logoImage = null;
      update();
    }
  }

  Future<void> companyregisterLogo() async {
    try {
      String logoBase64 = '';
      GetStorage box = GetStorage();
      String? api_token = await box.read('api_token');

      if (logoImage != null) {
        File file = File(logoImage!.path);
        if (file.existsSync()) {
          final logoBytes = await file.readAsBytes();
          logoBase64 = base64Encode(logoBytes);
        } else {
          return;
        }
      }

      if (api_token != null) {}
      var response = await companyauthlogoApi.companyregisterlogo(
        logoBase64,
      );

      if (!response['error']) {
        GetStorage box = GetStorage();
        await box.write('user_image', response['company']['logo']);
        Get.back();
      } else {
        print('logo Registration  not  not   successful');
      }
    } catch (error) {
      UiUtilites.successSnackbar('$error.t', 'error');
    }
  }
}
