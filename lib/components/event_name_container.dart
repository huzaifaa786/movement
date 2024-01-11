import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class EventNameContainer extends StatelessWidget {
  const EventNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 42),
      child: Row(
        children: [
          Text(
            'Event name',
            style: TextStyle(
              color: darkGrey,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
