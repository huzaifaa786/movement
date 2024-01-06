import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    Key? key,
    this.title,
    this.onTap,
    this.iconAsset,
    this.isSelected = false,
  }) : super(key: key);

  final title;
  final onTap;
  final iconAsset;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(38.0),
        decoration: isSelected
            ? BoxDecoration(
                boxShadow: [
                    BoxShadow(
                        color: darkGrey,
                        blurRadius: 18.8,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 1))
                  ],
                borderRadius: BorderRadius.circular(10),
                border: GradientBoxBorder(
                  width: 2,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      mainColor,
                      secondaryColor,
                    ],
                  ),
                ))
            : BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              height: 33,
              width: 33,
              color: isSelected ? mainColor:darkGrey,
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: isSelected
                    ? TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
                    : TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: darkGrey),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
