import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/allclient_box.dart';
import 'package:noobz/components/company_calendar_box.dart';
import 'package:noobz/views/company/calendar/company_calendar_controller.dart';

class CompanyCalendarView extends StatefulWidget {
  const CompanyCalendarView({super.key});

  @override
  State<CompanyCalendarView> createState() => _CompanyCalendarViewState();
}

class _CompanyCalendarViewState extends State<CompanyCalendarView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyCalendarController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Gap(40),
              CompanyCalendarBox(
                name: 'Ali Raza',
                type: 'Petrol payment',
              ),
            ],
          ),
        )),
      ),
    );
  }
}
