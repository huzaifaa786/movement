import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class googleloginbox extends StatelessWidget {
  const googleloginbox({
    Key? key,
    this.icon,
    this.ontap,
  }) : super(key: key);
  final icon;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: lightGrey,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
