import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class EventNameContainer extends StatelessWidget {
  const EventNameContainer(
      {super.key, required this.name, required this.color});
  final name;
  final color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
