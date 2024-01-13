import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/logintype.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<SigUpController>(
        builder: (controller) => Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 30, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Sign Up",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      )),
                  Gap(50),
                  MainInput(
                    controller: controller.EmailController,
                    prefixIcon: SvgPicture.asset(
                      'assets/images/email.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'Email address',
                  ),
                  Gap(2),
                  MainInput(
                    controller: controller.UsernameController,
                    prefixIcon: SvgPicture.asset(
                      'assets/images/person.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'User name',
                  ),
                  PasswordInput(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: 'Password',
                    toggle: controller.toggle,
                    obscure: controller.obscureTextPassword,
                    controller: controller.passwordController,
                  ),
                  PasswordInput(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: 'Confirm Password',
                    toggle: controller.toggle1,
                    obscure: controller.obscureTextPassword1,
                    controller: controller.confirmPasswordController,
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account?",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                      Gap(10),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.signIn);
                        },
                        child: Text("Sign in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: mainColor,
                              color: mainColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            )),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    height: 50,
                  ),
                  Text("Or contineo with",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      googleloginbox(
                        icon: 'assets/images/apple.svg',
                        ontap: () {},
                      ),
                      googleloginbox(
                        icon: 'assets/images/google.svg',
                        ontap: () {},
                      ),
                      googleloginbox(
                        icon: 'assets/images/mobile.svg',
                        ontap: () {
                          Get.toNamed(AppRoutes.withOtp);
                        },
                      ),
                    ],
                  ),
                  Gap(30),
                  Column(
                    children: [
                      Text(
                        'Already belong to company? Choose this to get a',
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'quick start!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/clarity_employee.svg'),
                      Gap(5),
                      Text("Under a company",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                  Gap(20),
                  MainButton(
                    title: 'Next',
                    isSelected: true,
                    onTap: () {
                      controller.registerUser();
                    },
                  ),
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
