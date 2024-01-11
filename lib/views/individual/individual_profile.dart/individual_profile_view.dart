// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noobz/components/change_password_card.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/individual_profile_card.dart';
import 'package:noobz/components/individual_rounded_circle.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/components/whites_blacks_card.dart';
import 'package:noobz/utils/colors.dart';

class IndividualProfileView extends StatefulWidget {
  const IndividualProfileView({super.key});

  @override
  State<IndividualProfileView> createState() => _IndividualProfileViewState();
}

class _IndividualProfileViewState extends State<IndividualProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'Add Client',
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
                name: 'Mohammed Yusif',
                nick: 'mo7Y0',
                email: 'mohammed3@gmail.com',
                icon: SvgPicture.asset('assets/images/email.svg')),
            ChangePasswordCard(),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 50),
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
          ],
        ),
      ),
    );
  }
}
