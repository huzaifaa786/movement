import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class CompanyProfileActionContainer extends StatelessWidget {
  const CompanyProfileActionContainer({
    Key? key,
    this.image,
    this.text,
  }) : super(key: key);

  final text;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 24,
                  width: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: individualhomeviewcalender,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Color(4282996965),
            )
          ],
        ),
      ),
    );
  }
}
