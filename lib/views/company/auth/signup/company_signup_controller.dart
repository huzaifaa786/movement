import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noobz/api/auth_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class CompanySignUPController extends GetxController {
  static CompanySignUPController instance = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authApi = UserApi();

  bool obscureTextPassword = true;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  Future<void> companyregisterUser() async {
    try {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        return;
      }
      var response = await authApi.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );

      if (response) {
      } else {}
    } catch (error) {
      print('Error registering user: $error');
    }
  }

  final picker = ImagePicker();
  late XFile? selectedLogo;
  late XFile? selectedLicense;

  // Method to open the image picker and select an image
  Future<void> pickImage(ImageType imageType) async {
    try {
      final pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        if (imageType == ImageType.logo) {
          selectedLogo = pickedImage;
        } else if (imageType == ImageType.license) {
          selectedLicense = pickedImage;
        }
        update();
      }
    } catch (error) {
      print('Error picking image: $error');
    }
  }

  // Method to upload the selected images
  Future<void> uploadImages() async {
    if (selectedLogo != null) {
      // Implement your logo image uploading logic here
      // You can use selectedLogo.path to access the image file path
      // and upload it to your desired location.
    }

    if (selectedLicense != null) {
      // Implement your license image uploading logic here
      // You can use selectedLicense.path to access the image file path
      // and upload it to your desired location.
    }
  }
}

enum ImageType {
  logo,
  license,
}
