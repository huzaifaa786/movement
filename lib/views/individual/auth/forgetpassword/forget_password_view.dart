import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_controller.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Forgot password",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ],
              ),
              Gap(50),
              MainInput(
                prefixIcon: SvgPicture.asset(
                  'assets/images/email.svg',
                  fit: BoxFit.scaleDown,
                ),
                hintText: 'Email address',
                controller: controller.emailController,

              ),
              Gap(200),
              MainButton(
                title: 'Send code',
                isSelected: true,
                onTap: () {
                  controller.ForgetPasswordUser();
                  
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
