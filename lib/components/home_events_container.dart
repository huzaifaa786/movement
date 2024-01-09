import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class HomeEventContainer extends StatelessWidget {
  const HomeEventContainer({
    Key? key,
    this.image,
    this.text,
  }) : super(key: key);
  final image;
final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12.5,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        border: GradientBoxBorder(
          width: 1,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondaryColor,
              mainColor,
            ],
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(image),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_outlined ,color: Color(4282996965),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
