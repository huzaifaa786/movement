import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/monthdatecontainer.dart';
import 'package:noobz/components/payment_date.dart';
import 'package:noobz/components/priceinput.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/add_payment/company_add_payment_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CompanyAddPaymentView extends StatefulWidget {
  const CompanyAddPaymentView({super.key});

  @override
  State<CompanyAddPaymentView> createState() => _CompanyAddPaymentViewState();
}

class _CompanyAddPaymentViewState extends State<CompanyAddPaymentView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyAddPaymentController>(
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
                name: 'Add payment',
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
                          children: [
                            Gap(40),
                            MainInput(
                              hintText: 'Payment name',
                            ),
                            Gap(12),
                            priceInput(
                              hintText: 'Payment amount',
                            ),
                            Gap(20),
                            PaymentDateContainer(
                              selectedOption: controller.selectedOption.value,
                              onOptionChanged: (int? value) =>
                                  controller.setSelectedOption(value),
                            ),
                            Gap(10),
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
                            if (controller.selectedOption.value ==
                                1) // Manually selected
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(4294375158)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '24 Dec 2023',
                                        style: TextStyle(
                                            color: individualduedate,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ]),
                              ),
                            Gap(10),
                            if (controller.selectedOption.value ==
                                2)  Column(
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
                           
                            Gap(50),
                            Row(
                              children: [
                                Text(
                                  'A rental payment?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            MainInput(
                              hintText: 'Unit name',
                            ),
                            MainInput(
                              hintText: 'Unit number',
                            ),
                            MainInput(
                              hintText: 'Unit type (villa, apartment, ... )',
                            ),
                            Gap(20)
                          ],
                        ))))));
  }
}
