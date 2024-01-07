import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/individual_rounded_circle.dart';
import 'package:noobz/utils/colors.dart';

class WhiteBlackCard extends StatelessWidget {
  const WhiteBlackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.24,
                  decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Whites',
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                        children: [
                          IndividualRoundedCircle(
                              colorinside: white, coloroutside: mainColor),
                          Gap(5),
                          IndividualRoundedCircle(
                              colorinside: white, coloroutside: mainColor),
                          Gap(5),
                          IndividualRoundedCircle(
                              colorinside: white, coloroutside: mainColor),
                          Gap(5),
                          IndividualRoundedCircle(
                              colorinside: white, coloroutside: mainColor),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: Text(
                          'Blacks',
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                        children: [
                          IndividualRoundedCircle(
                              colorinside: black, coloroutside: mainColor),
                          Gap(5),
                          IndividualRoundedCircle(
                              colorinside: black, coloroutside: mainColor),
                        ],
                      ),
                    ),
                  ])),
            )
         ;
  }
}