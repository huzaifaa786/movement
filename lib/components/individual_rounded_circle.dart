import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class IndividualRoundedCircle extends StatelessWidget {
  const IndividualRoundedCircle(
      {super.key, this.colorinside, this.coloroutside});

  final colorinside;
  final coloroutside;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ],
          color: colorinside,
          border: Border.all(width: 2, color: coloroutside),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
    );
  }
}
