// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/change_password_card.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/individual_profile_card.dart';
import 'package:noobz/utils/colors.dart';

class IndividualProfileView extends StatefulWidget {
  const IndividualProfileView({super.key});

  @override
  State<IndividualProfileView> createState() => _IndividualProfileViewState();
}

class _IndividualProfileViewState extends State<IndividualProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IndividualProfileAppBar(
                picture: 'assets/images/arrow_left.svg', name: 'Profile'),
            IndividualProfileCard(),
            ChangePasswordCard(),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 50),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/menu-grid-blue.svg'),
                  Gap(10),
                  Text(
                    'My Points',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.13,
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
                  
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
