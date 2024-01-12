// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class TitleTopBar extends StatelessWidget {
  const TitleTopBar({super.key, this.name, this.ontap});
  final name;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text('   ')
        ],
      ),
    );
  }
}
