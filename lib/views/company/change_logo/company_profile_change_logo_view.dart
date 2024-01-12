import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_controller.dart';

class CompanyProfileChangelogoView extends StatefulWidget {
  const CompanyProfileChangelogoView({super.key});

  @override
  State<CompanyProfileChangelogoView> createState() =>
      _CompanyProfileChangelogoViewState();
}

class _CompanyProfileChangelogoViewState
    extends State<CompanyProfileChangelogoView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyProfileChangelogocontroller>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              title: TitleTopBar(
                name: 'Change logo',
                ontap: () {
                  Get.back();
                },
              ),
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(
                        15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.53,
                          decoration: BoxDecoration(
                              // border: Border.all()
                              ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 55),
                                child: Container(
                                  // padding: EdgeInsets.only(top: 2),
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 12.5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child:
                                      //  SvgPicture.asset('assets/images/Profile Image.png')
                                      CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/Profile Image.png',
                                    ),
                                    radius: 60,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Container(
                                    height: 145,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                      color: Color(4294375158),
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Company logo',
                                            style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                                height: 62,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade200),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/changelogoupload.png',
                                                      height: 28,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Text(
                                                        'Upload new',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color:
                                                                individualhomeviewcalender),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: MainButton(
                            title: 'submit',
                            isSelected: true,
                          ),
                        )
                      ],
                    )))));
  }
}
