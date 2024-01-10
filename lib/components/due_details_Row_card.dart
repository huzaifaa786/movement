import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noobz/utils/colors.dart';

class DueDetailsRowCard extends StatelessWidget {
  const DueDetailsRowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  spreadRadius: -5.0,
                  blurRadius: 20.0,
                  color: darkGrey.withOpacity(0.4),
                  blurStyle: BlurStyle.inner),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, bottom: 10, right: 18),
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(40)),
                  child:
                      Image.asset('assets/images/viewcalender profileimg.png')),
            ),
            Text(
              'Adnoc',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}