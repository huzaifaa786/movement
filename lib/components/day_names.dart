import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class WeekDayName extends StatefulWidget {
  const WeekDayName(
      {Key? key,
      required this.name,
      required this.isSelected,
      required this.onDaySelected})
      : super(key: key);

  final String name;
  final bool isSelected;
  final VoidCallback onDaySelected;

  @override
  _WeekDayNameState createState() => _WeekDayNameState();
}

class _WeekDayNameState extends State<WeekDayName> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onDaySelected();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: widget.isSelected ? mainColor : darkGrey,
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
