import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noobz/utils/colors.dart';

class PaymentDateContainer extends StatelessWidget {
   final int? selectedOption;
  final ValueChanged<int?> onOptionChanged;

  const PaymentDateContainer({
    Key? key,
    required this.selectedOption,
    required this.onOptionChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
Color borderColor = selectedOption == 2 ? mainColor : borderGrey;
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Color(4294375158),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment dates',
              style: TextStyle(
                  color: darkGrey, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  // border: Border.all()
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue: selectedOption ,
                          activeColor: mainColor,
                          onChanged: onOptionChanged),
                      Text(
                        'Manually',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue: selectedOption ,
                          activeColor: mainColor,
                          onChanged: onOptionChanged),
                      Text(
                        'automatic',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(21),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.49,
                  decoration: BoxDecoration(
                      // border: Border.all()
                      ),
                  child: Text(
                    'Payments are for how many months?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 52,
                  width: 205,
                  decoration: BoxDecoration(
                      border: Border.all(color:borderColor ),
                      color: Color(4294967295),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // // border: Border.all(
                              //     color: borderGrey),
                            ),
                            child: TextField(
                              cursorColor: Colors.grey.shade400,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Text(
                            '|   Months ',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400),
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
