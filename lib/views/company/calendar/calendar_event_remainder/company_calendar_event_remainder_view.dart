import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/calender_event_remainder_container.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/calendar/calendar_event_remainder/company_calendar_event_remainder_controller.dart';
import 'package:noobz/views/individual/calender_event_remainder/calender_event_remainder_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CompanyCalendarEventRemainderView extends StatefulWidget {
  const CompanyCalendarEventRemainderView({super.key});

  @override
  State<CompanyCalendarEventRemainderView> createState() =>
      _CompanyCalendarEventRemainderViewState();
}

class _CompanyCalendarEventRemainderViewState
    extends State<CompanyCalendarEventRemainderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyCalendarEventRemainderController>(
        builder: (controller) => Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
              children: [
                IndividualProfileAppBar(
                  name: 'Calendar',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    child: TableCalendar(
                      selectedDayPredicate: (day) =>
                          isSameDay(day, controller.today),
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.now(),
                      focusedDay: controller.today,
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
                ),
                CalenderEventRemainderContainer(
                  calendereventremainder: 3,
                ),
              ],
            )))));
  }
}
