import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class MonthDateContainer extends StatelessWidget {
  const MonthDateContainer({
    Key? key,
    this.title,
  
  }) : super(key: key);

  final title;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Color(4294375158),
          borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: individualduedate,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SvgPicture.asset(
              'assets/images/cross_calender.svg',
              height: 17,
              width: 17,
            )
          ],
        ),
      ),
    );
  }
}
