import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    Key? key,
    this.title,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final title;
  final onTap;
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
            child: Text(
          title,
          style: isSelected
              ? TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
              : TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: darkGrey),
        )),
      ),
    );
  }
}
