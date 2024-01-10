import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class ClientinfoButton extends StatelessWidget {
  const ClientinfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width,
        height: 129,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(19))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/add.svg'),
                    Text(
                      ' Add payment',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: mainColor,
                  size: 18,
                )
              ],
            ),
            new Divider(
              color: const Color.fromARGB(255, 215, 213, 213),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/bell.svg'),
                    Text(
                      '  Add a notification',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: mainColor,
                  size: 18,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
