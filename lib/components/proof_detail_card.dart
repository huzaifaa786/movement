import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/utils/colors.dart';

class ProofDetailCard extends StatelessWidget {
  const ProofDetailCard(
      {super.key, required this.name, required this.date, required this.type});
  final String name;
  final String date;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGrey,
          border: Border.all(color: mainColor, width: 1)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/file.svg',
                fit: BoxFit.scaleDown,
              ),
              Gap(10),
              Text(
                name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Gap(30),
              Text(
                'View document',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Gap(15),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 15),
                child: Text("Due dates",
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Text(date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          Gap(15),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 15),
                child: Text("Type of payment",
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Text(type,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
