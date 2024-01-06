// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/language_card.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/utils/controller_initlization.dart';
import 'package:noobz/views/language/language_controller.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  void initState() {
    splashController.initscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 40, right: 18, left: 18),
                child: MainButton(
                  title: "Next",
                  isSelected: true,
                ),
              ),
              body: SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(40),
                        SvgPicture.asset('assets/images/appLogo.svg'),
                        Gap(40),
                        Text(
                          'Choose language',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 16),
                        ),
                        Gap(40),
                        LanguageCard(
                          onTap: () {
                            controller.language = 'english';
                            controller.update();
                          },
                          title: "English",
                          isSelected:
                              controller.language == 'english' ? true : false,
                        ),
                        Gap(40),
                        LanguageCard(
                          onTap: () {
                            controller.language = 'Arabic';
                            controller.update();
                          },
                          title: "عربي",
                          isSelected:
                              controller.language == 'Arabic' ? true : false,
                        ),
                        Gap(20),
                        MainInput(
                          hintText: "Email",prefixIcon: Icon(Icons.email_outlined),type: TextInputType.emailAddress,
                        ),
                        Gap(20),
                        MainInput(
                          hintText: "User name",prefixIcon: Icon(Icons.person_outline),type: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
