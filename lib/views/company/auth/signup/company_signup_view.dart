import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/company_card.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/auth/signup/company_signup_controller.dart';

class CompanySignUpView extends StatefulWidget {
  const CompanySignUpView({super.key});

  @override
  State<CompanySignUpView> createState() => _CompanySignUpViewState();
}

class _CompanySignUpViewState extends State<CompanySignUpView> {
  String? selectedOption;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanySignUPController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 30, bottom: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    controller: controller.nameController,
                    hintText: 'Company name',
                    fieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a company name';
                      }
                      return null;
                    },
                  ),
                  Gap(10),
                  MainInput(
                    prefixIcon: SvgPicture.asset(
                      'assets/images/email.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    controller: controller.emailController,
                    hintText: 'Email address',
                    fieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                  ),
                  Gap(10),
                  PasswordInput(
                    hintText: 'Password',
                    obscure: true,
                    controller: controller.passwordController,
                    prefixIcon: SvgPicture.asset(
                      'assets/images/lock_simple.svg',
                      fit: BoxFit.scaleDown,
                    ),
                      fieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  Gap(20),
                  CompanyCard(
                      title: 'Company logo',
                      onTap: () {
                        controller.selectlogoImage();
                      }),
                  Gap(20),
                  CompanyCard(
                      title: 'Company license',
                      onTap: () {
                        controller.selectlicenseImage();
                      }),
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
                                    Radio<String>(
                                      value: 'real_estate',
                                      groupValue: selectedOption,
                                      activeColor: mainColor,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value;
                                          controller.service_type = value;
                                        });
                                      },
                                    ),
                                    Text('Real estate'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'other_services',
                                      groupValue: selectedOption,
                                      activeColor: mainColor,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value;
                                          controller.service_type = value;
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
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with registration
                        controller.companyregisterUser();
                      } //  Get.toNamed(AppRoutes.companyhome);
                    },
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
