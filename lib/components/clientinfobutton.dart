import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class ClientinfoButton extends StatelessWidget {
  const ClientinfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(19))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/add.svg'),
                  Text('Add payment')
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: mainColor,
              )
            ],
          ),
          new Divider(
            color: Colors.red,
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/bell.svg'),
                  Text('Add a notification')
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: mainColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
