import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/utils/colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
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
                      'assets/images/email.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'Email address',
                  ),
                  Gap(10),
                  MainInput(
                    prefixIcon: SvgPicture.asset(
                      'assets/images/person.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'User name',
                  ),
                  Gap(20),
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: mainColor,
                          width: 1.0,
                        ))),
                        child: Text("Sign in",
                            style: TextStyle(
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
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: SvgPicture.asset(
                          'assets/images/apple.svg',
                          fit: BoxFit.none,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: SvgPicture.asset(
                          'assets/images/google.svg',height: 10,width: 10,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: SvgPicture.asset(
                          'assets/images/mobile.svg',
                          fit: BoxFit.none,
                        ),
                      )
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
                  ),
                ],
              ),
            ),
          )),
        );
      }
    );
  }
}
