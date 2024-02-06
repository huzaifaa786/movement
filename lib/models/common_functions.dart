// ignore_for_file: prefer_const_constructors

import 'package:academy_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_translator/google_translator.dart';

class CommonFunctions {
  static void showErrorDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!').translate(),
        content: Text(message, style: const TextStyle(color: Colors.red)).translate(),
        actions: <Widget>[
          MaterialButton(
            child: const Text('Okay').translate(),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade200,
        textColor: kToastTextColor,
        fontSize: 16.0);
  }

  static void showWarningToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade300,
        textColor: kToastTextColor,
        fontSize: 16.0);
  }
}
