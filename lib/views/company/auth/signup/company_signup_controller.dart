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
  late XFile? selectedImage;

  // Method to open the image picker and select an image
  Future<void> pickImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        selectedImage = pickedImage;
        update();
      }
    } catch (error) {
      print('Error picking image: $error');
    }
  }

  // Method to upload the selected image
  Future<void> uploadImage() async {
    if (selectedImage == null) {
      return;
    }

    // Implement your image uploading logic here
    // You can use the selectedImage.path to access the image file path
    // and upload it to your desired location.
  }
}
