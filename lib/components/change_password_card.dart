import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';

class ChangePasswordCard extends StatelessWidget {
  const ChangePasswordCard({
    Key? key,
    this.ontap,
  }) : super(key: key);
  final ontap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height * 0.08,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/lock.svg'),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text(
                    'Change password',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: SvgPicture.asset('assets/images/arrow_blue.svg'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
