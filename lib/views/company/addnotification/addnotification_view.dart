import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/addnotification/addnotification.controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AddnotificationView extends StatefulWidget {
  const AddnotificationView({super.key});

  @override
  State<AddnotificationView> createState() => _AddnotificationViewState();
}

class _AddnotificationViewState extends State<AddnotificationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNotificationController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Add Notification',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              MainInput(
                hintText: 'Type the notify',
              ),
              Gap(30),
              Row(children: [Text('Select Date',style: TextStyle(color: darkGrey),)],),
              Gap(10),
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                child: TableCalendar(
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.today),
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.now(),
                  focusedDay: controller.today,
                  onDaySelected: controller.onDaySelected,
                     headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                  calendarStyle: CalendarStyle(
                    
                    todayDecoration: BoxDecoration(
                        color: mainColor.withOpacity(0.5),
                        shape: BoxShape.circle),
                    selectedDecoration:
                        BoxDecoration(color: mainColor, shape: BoxShape.circle),
                    markerDecoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    rangeStartDecoration:
                        BoxDecoration(color: mainColor, shape: BoxShape.circle),
                    rangeEndDecoration:
                        BoxDecoration(color: mainColor, shape: BoxShape.circle),
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
              Gap(20),
               MainButton(title: 'Send notification',isSelected: true,),
            ],
          ),
        )),
      ),
    );
  }
}
