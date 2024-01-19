import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:noobz/utils/colors.dart';

class PaymentDateContainer extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String?> onOptionChanged;
  final List<String> options;
  final onInputChange;
  final controller;

  const PaymentDateContainer({
    Key? key,
    required this.selectedOption,
    required this.onOptionChanged,
    required this.options,
    this.onInputChange,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color borderColor = selectedOption == 2 ? mainColor : borderGrey;
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
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
                      Radio(
                          value: options.first,
                          groupValue: selectedOption,
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
                      Radio(
                          value: options[1],
                          groupValue: selectedOption,
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
            selectedOption == options[1]
                ? Column(
                    children: [
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
                                border: Border.all(color: borderColor),
                                color: Color(4294967295),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        controller: controller,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        maxLength: 2,
                                        keyboardType: TextInputType.number,
                                        onChanged: onInputChange,
                                        cursorColor: Colors.grey.shade400,
                                        decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none),
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
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
