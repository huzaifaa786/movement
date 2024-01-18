import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/utils/colors.dart';

class DueDetailsColumnCard extends StatelessWidget {
  const DueDetailsColumnCard({super.key});

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
                        '1235689',
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
                    'Petrol payment',
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
                    '23 / 11/ 2023',
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
                    '250.00',
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
                  SvgPicture.asset('assets/images/payment_cancel.svg'),
                  Gap(8),
                  Text(
                    '',
                    style: TextStyle(
                      color: red,
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
                height: MediaQuery.of(context).size.height * 0.08,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/upload-file.svg'),
                    Gap(6),
                    Text(
                      'Upload',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}