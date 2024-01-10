import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/utils/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class WithOtpView extends StatelessWidget {
  const WithOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Enter your phone number to',
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'to get an OTP code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(30),
            MainInput(hintText: 'phone number',),
            Gap(30),
              Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: mainColor,
                          width: 2.0,
                        ))),
                        child: Text("Send code",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
           Gap(50),
    OtpTextField(
            numberOfFields: 6,
            borderColor: mainColor,
            focusedBorderColor:mainColor,
            // styles: [TextStyle()],
            showFieldAsBox: false,
            borderWidth: 4.0,
            //runs when a code is typed in
            onCodeChanged: (String code) {
                //handle validation or checks here if necessary         
            },
            //runs when every textfield is filled 
            onSubmit: (String verificationCode) {

            }, 
    ),
    Gap(80),
            MainButton(title: 'Submit',)
          ],
        ),
      )),
    );
  }
}
