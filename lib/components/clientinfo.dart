import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class ClientInfoBox extends StatelessWidget {
  const ClientInfoBox({
    Key? key,
    this.name,
    this.type,
  }) : super(key: key);

  final name;
  final type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(19))),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/account.svg',
              height: 43,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          type,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
