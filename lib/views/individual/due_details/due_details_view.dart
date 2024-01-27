// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:noobz/components/due_details_Column_card.dart';
import 'package:noobz/components/due_details_Row_card.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/due_details/due_details_controller.dart';

class DueDetailsView extends StatefulWidget {
  const DueDetailsView({super.key});

  @override
  State<DueDetailsView> createState() => _DueDetailsViewState();
}

class _DueDetailsViewState extends State<DueDetailsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DueDetailsController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            title: TitleTopBar(
              name: 'Due details',
              ontap: () {
                Get.back();
              },
            ),
          ),
          body: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 22),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset('assets/images/share.svg'),
                    ),
                    Text(
                      'To',
                      style: TextStyle(
                        color: blackgrey,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              DueDetailsRowCard(
                user_name: controller.user_name,
              ),
              DueDetailsColumnCard(
                typeOfService: controller.typeOfService,
                trackingNumber: controller.trackingNumber,
                dueDate: controller.dueDate,
                amount: controller.amount,
                status: controller.status,
                onTap: controller.company_id == null
                    ? () {}
                    : () {
                        controller.selectPaymentImage();
                      },
                image:
                    controller.isSelected ? controller.paymentAttachment : null,
                isSelected: controller.isSelected,
                isCompanyUser: controller.company_id == null ? false : true,
              ),
              Gap(60),
              MainButton(
                isSelected: controller.company_id == null ? false : true,
                title: 'submit',
                onTap: () {
                  controller.UploadPaymentImage();
                },
              )
            ],
          ))),
    );
  }
}
