import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/auth/sigin/signin_controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
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
                controller: controller.emailController,
                prefixIcon: SvgPicture.asset(
                  'assets/images/email.svg',
                  fit: BoxFit.scaleDown,
                ),
                hintText: 'Email address',
              ),
              PasswordInput(
                controller: controller.passwordController,
                prefixIcon: Icon(Icons.lock_outline_rounded),
                hintText: 'Password',
                toggle: controller.toggle,
                obscure: controller.obscureTextPassword,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgetPassword);
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
                  controller.LoginUser();
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
