
// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class TrainerCourseName extends StatelessWidget {
  const TrainerCourseName({super.key, this.coursename});
  final coursename;
  @override
  Widget build(BuildContext context) {
    return Text(
      coursename,
      style: TextStyle(fontSize: 20),
    );
  }
}
