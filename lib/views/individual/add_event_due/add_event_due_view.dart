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
import 'package:noobz/utils/ui_utils.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AddEventDueView extends StatefulWidget {
  const AddEventDueView({Key? key}) : super(key: key);

  @override
  State<AddEventDueView> createState() => _AddEventDueViewState();
}

class _AddEventDueViewState extends State<AddEventDueView> {
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
                            child: MainInput(
                              controller: controller.eventController,
                            ),
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
                          value: controller.reminderOptions.first,
                          groupValue: controller.selectedReminder,
                          onChanged: (value) {
                            controller.selectedReminder = value!;
                            controller.update();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
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
                                    value: controller.reminderOptions[1],
                                    groupValue: controller.selectedReminder,
                                    onChanged: (value) {
                                      controller.selectedReminder = value!;
                                      controller.update();
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
                                    for (int i = 0;
                                        i < controller.weekdays.length;
                                        i++)
                                      WeekDayName(
                                        name: controller.weekdays[i],
                                        isSelected:
                                            controller.selectedWeekDay ==
                                                    controller.weekdays[i]
                                                ? true
                                                : false,
                                        onDaySelected: () {
                                          if (controller.selectedReminder ==
                                              controller.reminderOptions[1]) {
                                            controller.selectedWeekDay =
                                                controller.weekdays[i];
                                            controller.getFutureDates(
                                                controller.selectedWeekDay,
                                                controller.noOfWeekMonths);
                                            controller.update();
                                          }
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 20),
                                    child: EventNameContainer(
                                      color: blackgrey,
                                      name: 'Number of months',
                                    ),
                                  ),
                                  MainInputSmall(
                                    type: TextInputType.number,
                                    controller:
                                        controller.noOfWeekMonthsController,
                                    onChange: (value) {
                                      if (value == '') {
                                        controller
                                            .noOfWeekMonthsController.text = '';
                                        value = '1';
                                      } else {
                                        controller.noOfWeekMonthsController
                                            .text = value;
                                      }

                                      controller.noOfWeekMonths =
                                          int.parse(value);
                                      controller.getFutureDates(
                                          controller.selectedWeekDay,
                                          int.parse(value));
                                    },
                                  ),
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
                          height: MediaQuery.of(context).size.height * 0.265,
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
                                    value: controller.reminderOptions[2],
                                    groupValue: controller.selectedReminder,
                                    onChanged: (value) {
                                      controller.selectedReminder = value!;
                                      controller.update();
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
                                    WeekDayName(
                                      name: controller.months[i],
                                      isSelected: controller.selectedMonth ==
                                          controller.months[i],
                                      onDaySelected: () {
                                        controller.selectedMonth =
                                            controller.months[i];
                                        controller.getFutureYear(
                                            controller.selectedMonth,
                                            controller.noOfMonthYears);
                                        controller.update();
                                      },
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 20),
                                    child: EventNameContainer(
                                      color: blackgrey,
                                      name: 'Number of years',
                                    ),
                                  ),
                                  MainInputSmall(
                                    type: TextInputType.number,
                                    controller:
                                        controller.noOfMonthYearsController,
                                    onChange: (value) {
                                      if (value == '') {
                                        controller
                                            .noOfMonthYearsController.text = '';
                                        value = '1';
                                      } else {
                                        controller.noOfMonthYearsController
                                            .text = value;
                                      }

                                      controller.noOfMonthYears =
                                          int.parse(value);
                                      controller.getFutureYear(
                                          controller.selectedMonth,
                                          int.parse(value));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      controller.selectedReminder ==
                              controller.reminderOptions.first
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, top: 11),
                                  child: EventNameContainer(
                                      name: 'Select event date',
                                      color: darkGrey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 10, right: 10),
                                  child: TableCalendar(
                                    selectedDayPredicate: (day) =>
                                        isSameDay(day, controller.newtoday),
                                    firstDay:
                                        DateTime.now().add(Duration(hours: 30)),
                                    lastDay: DateTime.now()
                                        .add(Duration(days: 100000000000000)),
                                    focusedDay: controller.newtoday,
                                    onDaySelected: controller.onDaySelected,
                                    headerStyle: const HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true,
                                      titleTextStyle: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                    calendarStyle: CalendarStyle(
                                      todayDecoration: BoxDecoration(
                                          color: mainColor.withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      selectedDecoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle),
                                      markerDecoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      rangeStartDecoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle),
                                      rangeEndDecoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle),
                                      rangeHighlightColor:
                                          mainColor.withOpacity(0.5),
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
                                Gap(20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23, right: 23),
                                  child: PaymentDateContainer(
                                      controller:
                                          controller.noOfDayMonthsController,
                                      onInputChange: (value) {
                                        if (value == '') {
                                          controller.noOfDayMonthsController
                                              .text = '';
                                          value = '1';
                                        } else {
                                          controller.noOfDayMonthsController
                                              .text = value;
                                        }

                                        controller.noOfDayMonths =
                                            int.parse(value);
                                        controller.getFutureDatesFromDate(
                                            controller.selectedDayDate,
                                            int.parse(value));
                                        controller.update();
                                      },
                                      options: controller.paymentDates,
                                      selectedOption:
                                          controller.selectedPaymentDateType,
                                      onOptionChanged: (String? value) {
                                        controller.selectedPaymentDateType =
                                            value!;
                                        controller.update();
                                      }),
                                ),
                              ],
                            )
                          : Text(''),
                      Divider(
                        color: grey,
                        indent: 23,
                        endIndent: 23,
                      ),
                      Gap(30),
                      if (controller.selectedPaymentDateType ==
                              controller.paymentDates[1] &&
                          controller.selectedReminder ==
                              controller.reminderOptions.first)
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < controller.dailyMonths.length;
                                  i++)
                                Column(
                                  children: [
                                    MonthDateContainer(
                                      title: DateFormat('d MMM yyyy').format(
                                          DateTime.parse(
                                              controller.dailyMonths[i])),
                                      onTap: () {
                                        var date = DateFormat('d MMM yyyy')
                                            .format(DateTime.parse(
                                                controller.dailyMonths[i]));
                                        UiUtilites.confirmRemoveDateAlert(
                                            context,
                                            'Sure want to delete \n  $date  \n from selected dates?',
                                            () {
                                          controller.removeDailyMonths(i);
                                        }, () {
                                          Get.back();
                                        }, 'Yes', 'Cancel');
                                      },
                                    ),
                                    Gap(5),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (controller.selectedReminder ==
                          controller.reminderOptions[1])
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < controller.weeklyMonths.length;
                                  i++)
                                Column(
                                  children: [
                                    MonthDateContainer(
                                      title: DateFormat('d MMM yyyy').format(
                                          DateTime.parse(
                                              controller.weeklyMonths[i])),
                                      onTap: () {
                                        var date = DateFormat('d MMM yyyy')
                                            .format(DateTime.parse(
                                                controller.weeklyMonths[i]));
                                        UiUtilites.confirmRemoveDateAlert(
                                            context,
                                            'Sure want to delete \n  $date  \n from selected dates?',
                                            () {
                                          controller.removeWeeklyMonths(i);
                                        }, () {
                                          Get.back();
                                        }, 'Yes', 'Cancel');
                                      },
                                    ),
                                    Gap(5),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (controller.selectedReminder ==
                          controller.reminderOptions[2])
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < controller.monthlyYears.length;
                                  i++)
                                Column(
                                  children: [
                                    MonthDateContainer(
                                      title: DateFormat('d MMM yyyy').format(
                                          DateTime.parse(
                                              controller.monthlyYears[i])),
                                      onTap: () {
                                        var date = DateFormat('d MMM yyyy')
                                            .format(DateTime.parse(
                                                controller.monthlyYears[i]));
                                        UiUtilites.confirmRemoveDateAlert(
                                            context,
                                            'Sure want to delete \n  $date  \n from selected dates?',
                                            () {
                                          controller.removeYearly(i);
                                        }, () {
                                          Get.back();
                                        }, 'Yes', 'Cancel');
                                      },
                                    ),
                                    Gap(5),
                                  ],
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
                                      Radio(
                                          value: controller.eventTypes.first,
                                          groupValue:
                                              controller.selectedEventType,
                                          activeColor: mainColor,
                                          onChanged: (String? value) {
                                            controller.selectedEventType =
                                                value!;
                                            controller.update();
                                          }),
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
                                      Radio(
                                          value: controller.eventTypes[1],
                                          groupValue:
                                              controller.selectedEventType,
                                          activeColor: mainColor,
                                          onChanged: (String? value) {
                                            controller.selectedEventType =
                                                value!;
                                            controller.update();
                                          }),
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
                      controller.eventTypes.first ==
                              controller.selectedEventType
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 188,
                                    child: priceInput(
                                      controller: controller.amountController,
                                      hintText: 'Amount',
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(''),
                      Gap(50),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MainButton(
                          onTap: () {
                            controller.submit();
                          },
                          // buttonWidth: 0.9/,
                          title: 'Submit',
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
