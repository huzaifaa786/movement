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

  XFile? logoImage = XFile('');

  Future<void> selectlogoImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      logoImage = image;
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      print(logoImage);
      update();
    } else {
      logoImage = XFile('');
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
          print('ddddddddddddddddddddddddddddddddddd');
          print(logoBase64);
        } else {
          print('Logo image file does not exist.');
          return;
        }
      }
    
      if (api_token != null) {
        print('api token exists');
      }
      var response = await companyauthlogoApi.companyregisterlogo(
        logoBase64,
      );
      print('$response response a gya haaaaaaa');

      if (!response['error']) {
        print('logo Registration successful');
        Get.back();
      } else {
        print('logo Registration  not  not   successful');
      }
    } catch (error) {
      UiUtilites.successSnackbar('$error.t', 'error');
    }
  }
}
