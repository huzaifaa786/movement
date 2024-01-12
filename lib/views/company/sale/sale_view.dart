// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/sale/sale_controller.dart';

import 'package:table_calendar/table_calendar.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  List<String> shops = ['Shop 1', 'Shop 2', 'Shop 3'];
  String selectedShop = 'Select a shop';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Sales',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15,),
          child: Column(
            children: [
             
              Gap(12),
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TableCalendar(
                        selectedDayPredicate: (day) =>
                            isSameDay(day, controller.today),
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.now(),
                        focusedDay: controller.today,
                        rangeStartDay: controller.rangeStart,
                        rangeEndDay: controller.rangeEnd,
                        rangeSelectionMode: RangeSelectionMode.enforced,
                        // onDaySelected: saleController.onDaySelected,
                        onRangeSelected: controller.onRangeSelected,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: mainColor),
                        ),
                        calendarStyle: CalendarStyle(
                          // we
                          defaultTextStyle:
                              const TextStyle(color: Colors.black),
                          todayDecoration: BoxDecoration(
                              color: mainColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          selectedDecoration: const BoxDecoration(
                              color: mainColor, shape: BoxShape.circle),
                          markerDecoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          rangeStartDecoration: BoxDecoration(
                              color: mainColor, shape: BoxShape.circle),
                          rangeEndDecoration: BoxDecoration(
                              color: mainColor, shape: BoxShape.circle),
                          rangeHighlightColor: mainColor.withOpacity(0.2),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            runSpacing: 12,
            clipBehavior: Clip.antiAlias,
            alignment: WrapAlignment.center,
            children: [
              Divider(),
              Text('Total Sales',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: mainColor)),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(13)),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '0 AED',
                      style: TextStyle(
                          color: white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
