import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/utils/colors.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback  onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      width: MediaQuery.of(context).size.width,
      height: 145,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGrey,
          border: Border.all(color: borderGrey, width: 2)
          
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                color: darkGrey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          Gap(20),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 341,
              height: 62,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/upload.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  Gap(5),
                  Text("Upload",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
