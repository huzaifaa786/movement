import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/day_names.dart';
import 'package:noobz/components/event_name_container.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/main_input_small.dart';
import 'package:noobz/components/monthdatecontainer.dart';
import 'package:noobz/components/payment_date.dart';
import 'package:noobz/components/priceinput.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:gap/gap.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_controller.dart';
import 'package:table_calendar/table_calendar.dart';

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
    return GetBuilder<AddEventDueController>(
        builder: (controller) => Scaffold(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 20, top: 20),
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
                        padding:
                            const EdgeInsets.only(left: 32, right: 20, top: 20),
                        child: EventNameContainer(
                          name: 'Reminder pattern',
                          color: grey,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Day',
                          style: TextStyle(
                            color: black,
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
                                      color: black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, right: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 11),
                        child: EventNameContainer(
                            name: 'Select event date', color: darkGrey),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: TableCalendar(
                          selectedDayPredicate: (day) =>
                              isSameDay(day, controller.newtoday),
                          firstDay: DateTime.utc(2023, 1, 1),
                          lastDay: DateTime.now(),
                          focusedDay: controller.newtoday,
                          onDaySelected: controller.onDaySelected,
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                                color: mainColor.withOpacity(0.5),
                                shape: BoxShape.circle),
                            selectedDecoration: BoxDecoration(
                                color: mainColor, shape: BoxShape.circle),
                            markerDecoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            rangeStartDecoration: BoxDecoration(
                                color: mainColor, shape: BoxShape.circle),
                            rangeEndDecoration: BoxDecoration(
                                color: mainColor, shape: BoxShape.circle),
                            rangeHighlightColor: mainColor.withOpacity(0.5),
                            isTodayHighlighted: true,
                            outsideDaysVisible: false,
                          ),
                          availableCalendarFormats: const {
                            CalendarFormat.month: 'Month',
                          },
                          onPageChanged: controller.onFormatChanged,
                          calendarFormat: controller.format,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          daysOfWeekVisible: true,
                        ),
                      ),
                      Divider(
                        color: grey,
                        indent: 23,
                        endIndent: 23,
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        child: PaymentDateContainer(
                          selectedOption: controller.selectedOption.value,
                          onOptionChanged: (int? value) =>
                              controller.setSelectedOption(value),
                        ),
                      ),
                      Gap(30),
                      if (controller.selectedOption.value == 2)
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              MonthDateContainer(
                                title: '1 Jan 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Feb 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Mar 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Apr 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 May 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Jun 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Jul 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Aug 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Sep 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Oct 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Nov 2023',
                              ),
                              Gap(3),
                              MonthDateContainer(
                                title: '1 Dec 2023',
                              ),
                            ],
                          ),
                        ),
                      Gap(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Is there a Payment due?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: darkGrey),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 1,
                                        groupValue:
                                            controller.selectedOption.value,
                                        activeColor: mainColor,
                                        onChanged: (int? value) =>
                                            controller.setSelectedOption(value),
                                      ),
                                      Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 2,
                                        groupValue:
                                            controller.selectedOption.value,
                                        activeColor: mainColor,
                                        onChanged: (int? value) =>
                                            controller.setSelectedOption(value),
                                      ),
                                      Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 188,
                              child: priceInput(
                                hintText: 'amount',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(50),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MainButton(
                          // buttonWidth: 0.9/,
                          title: 'submit',
                          isSelected: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
