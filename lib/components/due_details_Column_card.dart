import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/colors.dart';

class DueDetailsColumnCard extends StatelessWidget {
  const DueDetailsColumnCard({
    Key? key,
    this.trackingNumber,
    this.typeOfService,
    this.dueDate,
    this.amount,
    this.status,
    this.onTap,
    this.image,
    this.isSelected,
    this.isCompanyUser,
  }) : super(key: key);
  final trackingNumber;
  final typeOfService;
  final dueDate;
  final amount;
  final status;
  final onTap;
  final image;
  final isSelected;
  final isCompanyUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.52,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, blurStyle: BlurStyle.normal, color: darkGrey)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/hash_image.svg'),
                  Gap(9),
                  Text(
                    'tracking number:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.035,
                    width: MediaQuery.of(context).size.width * 0.32,
                    decoration: BoxDecoration(color: white),
                    child: Center(
                      child: Text(
                        trackingNumber,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Gap(22),
              Row(
                children: [
                  SvgPicture.asset('assets/images/service_type.svg'),
                  Gap(15),
                  Text(
                    'Type of service:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(10),
                  Text(
                    typeOfService,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(33),
              Row(
                children: [
                  SvgPicture.asset('assets/images/money_exchange.svg'),
                  Gap(15),
                  Text(
                    'Due dates:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(15),
                  Text(
                    dueDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(33),
              Row(
                children: [
                  SvgPicture.asset('assets/images/money.svg'),
                  Gap(15),
                  Text(
                    'Amount:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(15),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(15),
                  Text(
                    'AED',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  SvgPicture.asset('assets/images/status.svg'),
                  Gap(15),
                  Text(
                    'Status:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(18),
                  status == 'unpaid'
                      ? SvgPicture.asset('assets/images/payment_cancel.svg')
                      : status == 'missed'
                          ? SvgPicture.asset('assets/images/payment_cancel.svg')
                          : status == 'paid'
                              ? SvgPicture.asset('assets/images/paid_icon.svg')
                              : SvgPicture.asset(
                                  'assets/images/payment_pending.svg'),
                  Gap(8),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'unpaid'
                          ? red
                          : status == ' missed'
                              ? red
                              : status == 'paid'
                                  ? Colors.green
                                  : Colors.amber,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  SvgPicture.asset(
                      'assets/images/payment_attachment_files.svg'),
                  Gap(17),
                  Text(
                    'Attachment payment proof:',
                    style: TextStyle(
                      color: blackgrey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(35),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.835,
                decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          blurStyle: BlurStyle.normal,
                          color: darkGrey)
                    ]),
                child: GestureDetector(
                  onTap: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isSelected == false
                          ? Row(
                              children: [
                                isCompanyUser == true
                                    ? SvgPicture.asset(
                                        'assets/images/upload-file.svg')
                                    : SvgPicture.asset(
                                        'assets/images/ep_upload-gray.svg'),
                                Gap(6),
                                Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: isCompanyUser ==true? mainColor: grey,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Image(image: FileImage(File(image.path))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
