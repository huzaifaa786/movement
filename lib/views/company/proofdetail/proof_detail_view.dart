import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';

class ProofDetailView extends StatelessWidget {
  const ProofDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Gap(10),
            TitleTopBar(
              name: 'Attachment details',
              ontap: () {},
            ),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Mo7o3',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Gap(30),
            Container(
              padding: EdgeInsets.only(top: 15, left: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: lightGrey,
                  border: Border.all(color: mainColor, width: 1)),
              child: Column(
                children: [
                  Row(
                    
                    children: [
                      SvgPicture.asset(
                        'assets/images/file.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        'Payment doc.pdf',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Gap(30),
                      Text(
                        'View document',
                        style: TextStyle(
                          color: mainColor,
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
