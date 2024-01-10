import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/utils/colors.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          children: [
            Row(
              children: [
                Text("Forgot password",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              ],
            ),
            Gap(50),
            MainInput(
              prefixIcon: SvgPicture.asset(
                'assets/images/email.svg',
                fit: BoxFit.scaleDown,
              ),
              hintText: 'Email address',
            ),
          
            Gap(200),
            MainButton(title: 'Send code',isSelected: true,)
          ],
        ),
      )),
    );
  }
}
