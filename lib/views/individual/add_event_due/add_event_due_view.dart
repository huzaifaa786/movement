import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/day_names.dart';
import 'package:noobz/components/event_name_container.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/main_input_small.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:gap/gap.dart';

class AddEventDueView extends StatefulWidget {
  const AddEventDueView({Key? key}) : super(key: key);

  @override
  State<AddEventDueView> createState() => _AddEventDueViewState();
}

List<String> options = ['Day', 'Weekly', 'Monthly'];

class _AddEventDueViewState extends State<AddEventDueView> {
  List<String> weekdays = ["S", "M", "T", "W", "TH", "F", "S"];
  String currentOption = options[0];
  List<bool> selectedDays = [false, false, false, false, false, false, false];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<bool> selectedMonths = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'Due details',
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 20, top: 20),
                  child: EventNameContainer(
                    name: 'Event name',
                    color: grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: MainInput(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 20, top: 20),
              child: EventNameContainer(
                name: 'Reminder pattern',
                color: grey,
              ),
            ),
            ListTile(
              title: Text(
                'Day',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Radio(
                activeColor: mainColor,
                value: options[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: mainColor,
                          value: options[1],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          },
                        ),
                        Text(
                          'Weekly',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < weekdays.length; i++)
                            DayNames(
                              name: weekdays[i],
                              isSelected: selectedDays[i],
                              onDaySelected: () {
                                setState(() {
                                  for (int j = 0;
                                      j < selectedDays.length;
                                      j++) {
                                    selectedDays[j] = false;
                                  }
                                  selectedDays[i] = true;
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 20, top: 20),
                          child: EventNameContainer(
                            color: blackgrey,
                            name: 'Number of months',
                          ),
                        ),
                        MainInputSmall(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.235,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: mainColor,
                          value: options[2],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          },
                        ),
                        Text(
                          'Monthly',
                          style: TextStyle(
                            color: black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        for (int i = 0; i < 12; i++)
                          DayNames(
                            name: months[i],
                            isSelected: selectedMonths[i],
                            onDaySelected: () {
                              setState(() {
                                for (int j = 0; j < 12; j++) {
                                  selectedMonths[j] = false;
                                }
                                selectedMonths[i] = true;
                              });
                            },
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 20, top: 20),
                          child: EventNameContainer(
                            color: blackgrey,
                            name: 'Number of years',
                          ),
                        ),
                        MainInputSmall(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
