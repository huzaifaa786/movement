import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_controller.dart';

class EnterCodeView extends StatelessWidget {
  const EnterCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnterCodeController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter verification code",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ))
                ],
              ),
              Gap(50),
              OtpTextField(
                numberOfFields: 6,
                borderColor: mainColor,
                focusedBorderColor: mainColor,
                // styles: [TextStyle()],
                showFieldAsBox: false,
                borderWidth: 4.0,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  controller.updateEnterCode();
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.otp = verificationCode;
                },
              ),
              Gap(150),
              MainButton(
                title: 'Submit',
                isSelected: controller.isCodeEntered,
                onTap: () {
                  controller.verifyOtp();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
