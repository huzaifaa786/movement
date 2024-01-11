// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/language_card.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/membership_card.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/utils/controller_initlization.dart';
import 'package:noobz/views/membership/membership_controller.dart';

class MembershipView extends StatefulWidget {
  const MembershipView({super.key});

  @override
  State<MembershipView> createState() => _MembershipViewState();
}

class _MembershipViewState extends State<MembershipView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MembershipController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 40, right: 18, left: 18),
                child: MainButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
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
                          'Choose membership type',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 16),
                        ),
                        Gap(40),
                        MembershipCard(
                          iconAsset: 'assets/images/building.svg',
                          onTap: () {
                            controller.membership_type = 'company';
                            controller.update();
                          },
                          title: "Company",
                          isSelected: controller.membership_type == 'company'
                              ? true
                              : false,
                        ),
                         Gap(40),
                        MembershipCard(
                          iconAsset: 'assets/images/owner.svg',
                          onTap: () {
                            controller.membership_type = 'Property owner';
                            controller.update();
                          },
                          title: "Property owner",
                          isSelected:
                              controller.membership_type == 'Property owner'
                                  ? true
                                  : false,
                        ),
                        Gap(40),
                        MembershipCard(
                          iconAsset: 'assets/images/user.svg',
                          onTap: () {
                            controller.membership_type = 'individual';
                            controller.update();
                          },
                          title: "Individual",
                          isSelected: controller.membership_type == 'individual'
                              ? true
                              : false,
                        ),
                        Gap(20),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
