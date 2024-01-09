import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class priceInput extends StatelessWidget {
  const priceInput({
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
    return TextField(
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 14, right: 10),
          child: Text(
            '|   AED',
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
