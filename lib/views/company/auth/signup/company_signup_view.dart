import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/company_card.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/auth/signin/signin_controller.dart';

class CompanySignUpView extends StatefulWidget {
  const CompanySignUpView({super.key});

  @override
  State<CompanySignUpView> createState() => _CompanySignUpViewState();
}

class _CompanySignUpViewState extends State<CompanySignUpView> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<CompanySignInController>(
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
                    prefixIcon: SvgPicture.asset(
                      'assets/images/company_building.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'Company name',
                  ),
                  Gap(10),
                  MainInput(
                    prefixIcon: SvgPicture.asset(
                      'assets/images/email.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'Email address',
                  ),
                  Gap(10),
                  PasswordInput(
                    hintText: 'Password',
                    toggle: controller.toggle,
                    obscure: controller.obscureTextPassword,
                    controller: controller.passwordController,
                    
                    prefixIcon: SvgPicture.asset(
                      'assets/images/lock_simple.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Gap(20),
                  CompanyCard(title: 'Company logo', onTap: () {}),
                  Gap(20),
                  CompanyCard(title: 'Company license', onTap: () {}),
                  Gap(20),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    //height: 123,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: lightGrey,
                        border: Border.all(color: borderGrey, width: 2)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("Type of service",
                                  style: TextStyle(
                                      color: darkGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio<int>(
                                      value: 1,
                                      groupValue: selectedOption,
                                      activeColor: mainColor,
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text('Real estate'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<int>(
                                      value: 2,
                                      groupValue: selectedOption,
                                      activeColor: mainColor,
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text('Other service'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(30),
                  MainButton(
                    title: 'Submit',
                    isSelected: true,
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
