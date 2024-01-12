import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/password_input.dart';
import 'package:noobz/components/payment_date.dart';
import 'package:noobz/components/priceinput.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/client/addclient/addclient_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClientView extends StatefulWidget {
  const AddClientView({super.key});

  @override
  State<AddClientView> createState() => _AddClientViewState();
}

class _AddClientViewState extends State<AddClientView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddClientController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Add Client',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Personal info',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Gap(12),
                MainInput(
                    hintText: 'User name',
                    prefixIcon: Image.asset(
                      'assets/images/account.png',
                    )),
                MainInput(
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined)),
                PasswordInput(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: 'Password',
                  toggle: controller.toggle,
                  obscure: controller.obscureTextPassword,
                  controller: controller.passwordController,
                ),
                PasswordInput(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: 'Confirm Password',
                  toggle: controller.toggle1,
                  obscure: controller.obscureTextPassword1,
                  controller: controller.confirmPasswordController,
                ),
                Gap(10),
                new Divider(
                  color: const Color.fromARGB(255, 220, 217, 217),
                ),
                MainInput(
                  hintText: 'Payment name',
                ),
                Gap(12),
                priceInput(
                  hintText: 'Price',
                ),
                Gap(12),
                PaymentDateContainer(
                  selectedOption: controller.selectedOption.value,
                  onOptionChanged: (int? value) =>
                      controller.setSelectedOption(value),
                ),
                Gap(15),
                TableCalendar(
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
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: mainColor.withOpacity(0.5),
                        shape: BoxShape.circle),
                    selectedDecoration:
                        BoxDecoration(color: mainColor, shape: BoxShape.circle),
                    markerDecoration: BoxDecoration(
                      color: Colors.black,
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
                MainInput(
                  hintText: 'date',
                ),
                Gap(10),
                Row(
                  children: [
                    Text(
                      'A rental payment?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                Gap(15),
                MainButton(
                  title: 'Submit',
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
