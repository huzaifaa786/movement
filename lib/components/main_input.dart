import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class MainInput extends StatelessWidget {
  const MainInput({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.type,
  }) : super(key: key);

  final controller;
  final hintText;
  final prefixIcon;
  final type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: darkGrey, fontSize: 14, fontWeight: FontWeight.w500),
          fillColor: lightGrey,
          prefixIcon: prefixIcon,
          prefixIconColor: darkGrey,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: borderGrey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: borderGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: borderGrey)),
        ),
      ),
    );
  }
}
