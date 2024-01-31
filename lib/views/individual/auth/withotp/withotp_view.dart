import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:noobz/components/main_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:noobz/utils/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_controller.dart';

class WithOtpView extends StatelessWidget {
  const WithOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithOtpController>(
      builder: (controller) => Scaffold(
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
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 90,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    fillColor: lightGrey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  languageCode: "en",
                  onChanged: (phone) {
                    if (countries
                            .firstWhere((element) =>
                                element.code == phone.countryISOCode)
                            .maxLength ==
                        phone.number.length) {
                      controller.phone = phone.number;
                      controller.completePhone = phone.completeNumber;
                    } else {
                      controller.completePhone = '';
                    }
                  },
                ),
              ),
              Gap(30),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: mainColor,
                  width: 2.0,
                ))),
                child: GestureDetector(
                  onTap: () {
                    controller.sendTokenforSignUP();
                  },
                  child: Text("Send code",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ),
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
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  // controller.verifyPhone(verificationCode);
                  controller.otpCode = verificationCode;
                  controller.isSelected = true;
                },
              ),
              Gap(80),
              MainButton(
                title: 'Submit',
                isSelected: controller.isSelected,
                onTap: () {
                  controller.verifyPhone(controller.otpCode);
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
