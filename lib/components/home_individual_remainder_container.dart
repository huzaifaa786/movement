import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class HomeIndividualRemainderContainer extends StatelessWidget {
  const HomeIndividualRemainderContainer({
    Key? key,
    this.isRemainder = false,
  }) : super(key: key);
  
  final bool isRemainder;
  
  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    
    if (isRemainder) {
      decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: GradientBoxBorder(
          width: 1,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondaryColor,
              mainColor,
            ],
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12.5,
            offset: Offset(0, 2),
          ),
        ],
      );
    } else {
      decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12.5,
            offset: Offset(0, 2),
          ),
        ],
      );
    }
    
    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      decoration: decoration,
      child: isRemainder
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 18),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/Profile Image.png',
                        ),
                        radius: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Adnoc',
                        style: TextStyle(
                          fontSize: 18,
                          color: individualhomeviewcalender,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13, left: 54, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rental payment',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View calendar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: individualhomeviewcalender,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: individualhomeviewcalender,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No reminders for the day',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View calendar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: individualhomeviewcalender,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: individualhomeviewcalender,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}