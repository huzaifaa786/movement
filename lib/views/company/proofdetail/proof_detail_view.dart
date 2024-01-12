import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/proof_detail_card.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_controller.dart';

class ProofDetailView extends StatelessWidget {
  const ProofDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProofDetailController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Attachment details',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Gap(30),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/health_profile.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  Gap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohammed Yusif',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Mo7o3',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              Gap(30),
              ProofDetailCard(
                  name: 'Payment doc.pdf',
                  date: '23 Dec2023',
                  type: 'Petrol payment'),
              Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Center(
                      child: Text("Accept",
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: mainColor),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Center(
                      child: Text("Reject",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
