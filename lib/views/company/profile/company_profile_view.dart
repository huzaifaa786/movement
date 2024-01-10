import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
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
                        child: Column(
              children: [
                IndividualProfileAppBar(name: '',)
                
                ],
            )))));
  }
}
