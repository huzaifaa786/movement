import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/components/company_profile_action_container.dart';
import 'package:noobz/components/company_profile_main_container.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/profile/company_profile_controller.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyProfileController>(
        builder: (controller) => Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 15, right: 15),
              child: Column(
                children: [
                  IndividualProfileAppBar(
                    name: 'Company profile',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 50),
                    child: CompanyProfileMainContainer(
                      profilepic: 'assets/images/Profile Image.png',
                      title: 'Adnoc',
                    ),
                  ),
                  CompanyProfileActionContainer(
                    text: 'Change password',
                    image: 'assets/images/companyprofilechngepassword.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: CompanyProfileActionContainer(
                      text: 'Change logo',
                      image: 'assets/images/companyprofilechangelogo.png',
                    ),
                  ),
                  CompanyProfileActionContainer(
                    text: 'Change language',
                    image: 'assets/images/companyprofilechangelang.png',
                  ),
                ],
              ),
            )))));
  }
}
