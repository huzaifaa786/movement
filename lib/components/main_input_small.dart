import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/colors.dart';

class MainInputSmall extends StatelessWidget {
  const MainInputSmall({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.type,
    this.onChange,
  }) : super(key: key);

  final controller;
  final hintText;
  final prefixIcon;
  final type;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 90,
        height: 40,
        
        child: TextField(
          controller: controller,
          keyboardType: type,
          onChanged: onChange,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: darkGrey, fontSize: 14, fontWeight: FontWeight.w500),
            fillColor: lightGrey,
            prefixIcon: prefixIcon,
            prefixIconColor: darkGrey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 2, color: borderGrey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 2, color: borderGrey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 2, color: borderGrey)),
          ),
        ),
      ),
    );
  }
}
