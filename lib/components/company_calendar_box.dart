import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/colors.dart';

class CompanyCalendarBox extends StatelessWidget {
  const CompanyCalendarBox({
    Key? key,
    this.name,
    this.type,
  }) : super(key: key);

  final name;
  final type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(19)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/account.svg',
                  height: 43,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width * 0.22,
                                child: Text(
                                  type,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              
                              Text("3500 AED",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                                  Gap(10),
                              Row(
                                children: [
                                  Text(
                                    'View Client ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: mainColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                    color: mainColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
