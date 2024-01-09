import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:noobz/utils/colors.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {Key? key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.obscure,
      this.toggle,
      this.validator,
      this.type,
      this.readOnly,
      this.autovalidateMode})
      : super(key: key);

  final controller;
  final hintText;
  final prefixIcon;
  final validator;
  final type;
  final toggle;
  final obscure;
  final autovalidateMode;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        // readOnly: readOnly,
        obscureText: obscure,
        controller: controller,
        keyboardType: type,
        validator: validator,
        autovalidateMode: autovalidateMode ??
            (validator == true.obs
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction),
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
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
              onTap: () {
                toggle();
              }, 
              child: obscure
                  ? SvgPicture.asset(
                      'assets/images/show.svg',
                      height: 24,
                      fit: BoxFit.scaleDown,
                    )
                  : Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 187, 185, 185),
                    )),
        ),
      ),
    );
  }
}
