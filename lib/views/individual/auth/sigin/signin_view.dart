import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/utils/colors.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            Center(
              child: Text("Sign in",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700)),
            ),
            Gap(60),
            MainInput(
              prefixIcon: SvgPicture.asset(
                'assets/images/email.svg',
                fit: BoxFit.scaleDown,
              ),
              hintText: 'Email address',
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot password?",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ))
              ],
            ),
            Gap(100),
            MainButton(title: 'Next',isSelected: true,)
          ],
        ),
      )),
    );
  }
}
