import 'package:flutter/material.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/utils/colors.dart';

class CalenderEventRemainderContainer extends StatelessWidget {
  const CalenderEventRemainderContainer({
    Key? key,
    this.calendereventremainder,
  }) : super(key: key);

  final int? calendereventremainder;

  @override
  Widget build(BuildContext context) {
    if (calendereventremainder == 0) {
      return Container(
          height: 270,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(4293322470),
              border: Border.all(color: Colors.grey.shade400)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          // decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/Profile Image.png',
                                  ),
                                  radius: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 98,
                            // decoration: BoxDecoration( border: Border.all()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 25),
                                  child: Text(
                                    'Adnoc',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: individualhomeviewcalender,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Rental payment',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Container(
                        // decoration: BoxDecoration( border: Border.all()),
                        height: 98,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '3500 AED',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: individualhomeviewcalender,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: MainButton(
                  isSelected: true,
                  buttonWidth: 0.92,
                  onTap: () {},
                  title: 'Submit Attachment',
                ),
              ),
            ],
          ));
    } else if (calendereventremainder == 1) {
      return Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(4293322470),
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No reminders for the day',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    } else if (calendereventremainder == 2) {
      return Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(4293322470),
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                          'assets/images/notification_rental_payment.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          'Dental date',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '3500 AED',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(4281352142),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(4293322470),
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Image.asset('assets/images/notification_rental_payment.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      'My football exercise',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
