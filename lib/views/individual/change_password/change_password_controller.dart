import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/utils/string.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController instance = Get.find();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  Future<void> changePasswordUser() async {
    if (oldPasswordController.text.isEmpty ||
        newPasswordcontroller.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return;
    }
          var response = await UserApi.changePassword(
        oldPasswordController.text,
        newPasswordcontroller.text,
        confirmPasswordController.text,
      );
       if (!response['error']) {
        print('i am here');
      } else {
        print('responce have error');
      }
    } 
  }

