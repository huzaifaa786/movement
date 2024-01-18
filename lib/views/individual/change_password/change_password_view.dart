import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/individual/change_password/change_password_controller.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  

  // @override
  // void dispose() {
  //   _currentPasswordController.dispose();
  //   _newPasswordController.dispose();
  //   _confirmPasswordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Change password',
            ontap: () {
              Get.back();
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: MainButton(
            // buttonWidth: 0.9/,
            title: 'submit',
            isSelected: true,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 60, bottom: 8),
                        child: MainInput(
                          controller: controller.oldPasswordController,
                          hintText: 'Old Password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 8),
                        child: MainInput(
                          controller: controller.newPasswordcontroller,
                          hintText: 'New Password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: MainInput(
                          controller: controller.confirmPasswordController,
                          hintText: 'Confirm New Password',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
