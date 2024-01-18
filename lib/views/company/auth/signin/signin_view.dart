import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/auth/signin/signin_controller.dart';

class CompanySignInView extends StatelessWidget {
  const CompanySignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanySignInController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
              Center(
                child: Text("Sign in",
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.w700)),
              ),
              Gap(60),
              MainInput(
                prefixIcon: SvgPicture.asset(
                  'assets/images/email.svg',
                  fit: BoxFit.scaleDown,
                ),
                hintText: 'Email address',
                controller: controller.emailController,
              ),
              PasswordInput(
                prefixIcon: Icon(Icons.lock_outline_rounded),
                hintText: 'Password',
                toggle: controller.toggle,
                obscure: controller.obscureTextPassword,
                controller: controller.passwordController,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.toNamed(AppRoutes.forgetPassword);
                      // controller.companyloginUser();
                    },
                    child: Text("Forgot password?",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                  )
                ],
              ),
              Gap(100),
              MainButton(
                title: 'Next',
                isSelected: true,
                onTap: () {
                  // Get.toNamed(AppRoutes.individualHome);
                  controller.companyLoginUser();
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
