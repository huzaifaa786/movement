import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/payment_date.dart';
import 'package:noobz/components/priceinput.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/add_event/add_event_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CompanyAddEventView extends StatefulWidget {
  const CompanyAddEventView({super.key});

  @override
  State<CompanyAddEventView> createState() => _CompanyAddEventViewState();
}

class _CompanyAddEventViewState extends State<CompanyAddEventView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyAddEventController>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 40, right: 18, left: 18),
              child: MainButton(
                onTap: () {},
                title: "Submit",
                isSelected: true,
              ),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              title: TitleTopBar(
                name: 'Add event',
                ontap: () {
                  Get.back();
                },
              ),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event name',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: darkGrey),
                            ),
                            MainInput(
                              hintText: 'Petrol payment',
                            ),
                            Gap(20),
                            Text(
                              'Select event date',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: darkGrey),
                            ),
                            Gap(5),
                            TableCalendar(
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
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 1,
                            ),
                            Gap(10),
                            PaymentDateContainer(
                              selectedOption: controller.selectedOption.value,
                              onOptionChanged: (int? value) =>
                                  controller.setSelectedOption(value),
                            ),
                            Gap(30),
                            Text(
                              'Is there a Payment due?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: darkGrey),
                            ),
                            Container(width: MediaQuery.of(context).size.width*0.7,
                                decoration: BoxDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio<int>(
                                          value: 1,
                                          groupValue: controller.selectedOption.value,
                                          activeColor: mainColor,
                                          onChanged:(int? value) =>
                                    controller.setSelectedOption(value),),
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
                                         groupValue: controller.selectedOption.value,
                                          activeColor: mainColor,
                                          onChanged:(int? value) =>
                                    controller.setSelectedOption(value),),
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
                            Gap(5),
                            Container(width: 188,
                            
                              child: priceInput(
                                hintText: 'amount',
                              ),
                            ),
                             Gap(40),
                          ],
                        ))))));
  }
}
