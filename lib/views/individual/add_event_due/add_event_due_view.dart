import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:noobz/components/event_name_container.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';

enum Day { day }

class AddEventDueView extends StatefulWidget {
  const AddEventDueView({Key? key}) : super(key: key);

  @override
  State<AddEventDueView> createState() => _AddEventDueViewState();
}

class _AddEventDueViewState extends State<AddEventDueView> {
  Day? _day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                EventNameContainer(),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: MainInput(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 33),
                  child: Row(
                    children: [
                      Text(
                        'Reminder pattern',
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _day = _day == Day.day ? null : Day.day;
                    });
                  },
                  child: Row(
                    children: [
                      Radio<Day>(
                        value: Day.day,
                        groupValue: _day,
                        onChanged: (Day? value) {
                          setState(() {
                            _day = value;
                          });
                        },
                      ),
                      Text(
                        'Day',
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
