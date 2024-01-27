// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/components/change_password_card.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/individual_profile_card.dart';
import 'package:noobz/components/individual_rounded_circle.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/components/whites_blacks_card.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_controller.dart';

class IndividualProfileView extends StatefulWidget {
  const IndividualProfileView({super.key});

  @override
  State<IndividualProfileView> createState() => _IndividualProfileViewState();
}

class _IndividualProfileViewState extends State<IndividualProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndividualProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Profile',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              IndividualProfileCard(
                  userpic: SvgPicture.asset('assets/images/user_profile.svg'),
                  name: controller.name,
                  email: controller.email,
                  icon: SvgPicture.asset('assets/images/email.svg')),
              ChangePasswordCard(
                ontap: () {
                  Get.toNamed(AppRoutes.changePassword);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/menu-grid-blue.svg'),
                    Gap(10),
                    Text(
                      'My Points',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              WhiteBlackCard(),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: InkWell(
                    onTap: () async {
                      GetStorage box = GetStorage();
                      String? api_token = await box.read('api_token');

                      box.remove('api_token');
                      Get.offNamed(AppRoutes.signIn);
                      print('Logout');
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: mainColor, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
