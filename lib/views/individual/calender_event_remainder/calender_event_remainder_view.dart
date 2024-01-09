import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/calender_event_remainder_container.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/calender_event_remainder/calender_event_remainder_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderEventRemainderView extends StatefulWidget {
  const CalenderEventRemainderView({super.key});

  @override
  State<CalenderEventRemainderView> createState() =>
      _CalenderEventRemainderViewState();
}

class _CalenderEventRemainderViewState
    extends State<CalenderEventRemainderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalenderEventRemainderController>(
        builder: (controller) => Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
              children: [
                IndividualProfileAppBar(
                  name: 'Calendar',
                  picture: 'assets/images/arrow_left.svg',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TableCalendar(
                      selectedDayPredicate: (day) =>
                          isSameDay(day, controller.today),
                      firstDay: DateTime.utc(2024, 1, 1),
                      lastDay: DateTime.now(),
                      focusedDay: controller.today,
                      rangeStartDay: controller.rangeStart,
                      rangeEndDay: controller.rangeEnd,
                      rangeSelectionMode: RangeSelectionMode.enforced,
                      onDaySelected: controller.onDaySelected,
                      onRangeSelected: controller.onRangeSelected,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            color: Color.fromARGB(255, 56, 125, 181),
                            fontSize: 23),
                      ),
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: const TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                            color: mainColor.withOpacity(0.5),
                            shape: BoxShape.circle),
                        selectedDecoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              mainColor,
                              secondaryColor,
                            ]),
                            shape: BoxShape.circle),
                        markerDecoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        rangeStartDecoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              mainColor,
                              secondaryColor,
                            ]),
                            shape: BoxShape.circle),
                        rangeEndDecoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              mainColor,
                              secondaryColor,
                            ]),
                            shape: BoxShape.circle),
                        rangeHighlightColor: secondaryColor.withOpacity(0.2),
                        isTodayHighlighted: true,
                        outsideDaysVisible: false,
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                        // CalendarFormat.week: 'Week',
                      },
                      onPageChanged: controller.onFormatChanged,
                      calendarFormat: controller.format,
                      onFormatChanged: (CalendarFormat format) {
                        setState(() {
                          format == CalendarFormat.week
                              ? controller.format1 = 'week'
                              : controller.format1 = 'month';
                          controller.format = format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekVisible: true,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        weekendStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                CalenderEventRemainderContainer(
                  calendereventremainder: 1,
                ),
              ],
            )))));
  }
}
