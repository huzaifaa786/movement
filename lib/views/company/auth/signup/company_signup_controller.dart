import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noobz/api/company_auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanySignUPController extends GetxController {
  static CompanySignUPController instance = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final companyauthApi = ComapnyAuthApi();

  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

// license = cv, pssprt = logo

  String? service_type = "real_estate";
  XFile? logoImage = XFile('');
  XFile? licenseImage = XFile('');

  Future<void> selectlogoImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      logoImage = image;
      update();
    } else {
      logoImage = XFile('');
      update();
    }
  }

  Future<void> selectlicenseImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      licenseImage = image;
      update();
    } else {
      licenseImage = XFile('');
      update();
    }
  }

  Future<void> companyregisterUser() async {
    // try {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
            print('Please fill in all fields');
        return;
      }

      String logoBase64 = '';
      String licenseBase64 = '';

      if (logoImage != null) {
        final logoBytes = await File(logoImage!.path).readAsBytes();
        logoBase64 = base64Encode(logoBytes);
      }

      if (licenseImage != null) {
        final licenseBytes = await File(licenseImage!.path).readAsBytes();
        licenseBase64 = base64Encode(licenseBytes);
      }
      print(licenseBase64);

      var response = await companyauthApi.companyregister(
        nameController.text,
        emailController.text,
        passwordController.text,
        logoBase64,
        licenseBase64,
        service_type ,
      );
      print('response a gya haaaaaaa');

      if (!response['error']) {

        print('Registration successful');
      } else {
        print('Registration  not  not   successful');
      }
    // } catch (error) {
    //   print('Error registering user: $error');
    // }
  }
}
