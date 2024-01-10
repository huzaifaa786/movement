import 'package:flutter/material.dart';
import 'package:noobz/components/event_name_container.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/main_input.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            IndividualProfileAppBar(name: 'Add event'),
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
                // Use a proper Radio widget with the correct types
                Radio<Day>(
                  value: Day.day,
                  groupValue: _day,
                  onChanged: (Day? value) {
                    setState(() {
                      _day = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
