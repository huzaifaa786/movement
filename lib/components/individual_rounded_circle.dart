import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class IndividualRoundedCircle extends StatelessWidget {
  const IndividualRoundedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: white,
          border: Border.all(width: 2, color: mainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
    );
  }
}
