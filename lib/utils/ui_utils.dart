// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class UiUtilites {
  static errorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: white,
      backgroundColor: red.withOpacity(0.7),
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successSnackbar(String message, String title) {
    Get.snackbar(
      title,
      message,
      backgroundColor: mainColor,
      // backgroundGradient: const LinearGradient(
      //   colors: [mainColor, secondaryColor],
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      // ),
      colorText: white,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successAlert(context, title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  // BoxShadow(
                  //     blurRadius: 20,
                  //     offset: Offset(12, 15),
                  //     color: Colors.black),
                  // BoxShadow(
                  //     blurRadius: 20,
                  //     offset: Offset(12, -15),
                  //     color: Colors.black),
                  // BoxShadow(
                  //     blurRadius: 20,
                  //     offset: Offset(-12, 15),
                  //     color: Colors.black),
                  // BoxShadow(
                  //     blurRadius: 20,
                  //     offset: Offset(-12, -15),
                  //     color: Colors.black)
                ],
              
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(40),
                  Icon(Icons.verified,size: 36,color: Colors.green,),
                  Gap(10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: black,
                      // height: 52 / 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(40),
                ],
              ),
            ),
          );
        });
  }

  static confirmRemoveDateAlert(
      context, title, onPressOK, onPressCancel, textOk, textCancel) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.transparent, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.05,
                decoration: BoxDecoration(
                  color: white,
                  // boxShadow: [
                  //   // BoxShadow(
                  //   //     blurRadius: 20,
                  //   //     offset: Offset(12, 15),
                  //   //     color: Colors.black),
                  //   // BoxShadow(
                  //   //     blurRadius: 10,
                  //   //     offset: Offset(12, -15),
                  //   //     color: Colors.black),
                  //   // BoxShadow(
                  //   //     blurRadius: 20,
                  //   //     offset: Offset(-12, 15),
                  //   //     color: Colors.black),
                  //   // BoxShadow(
                  //   //     blurRadius: 20,
                  //   //     offset: Offset(-12, -15),
                  //   //     color: Colors.black)
                  // ],

                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Gap(30),
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        // height: 52 / 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(10),
                    Divider(
                      height: 1,
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: onPressOK,
                          child: Text(
                            textOk,
                            style: const TextStyle(
                              color: mainColor,
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onPressCancel,
                          child: Text(
                            textCancel,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
