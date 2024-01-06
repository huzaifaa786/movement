import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/components/home_events_container.dart';
import 'package:noobz/components/home_individual_remainder_container.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/home/Individual_home_controller.dart';

class IndividualHomeView extends StatefulWidget {
  const IndividualHomeView({super.key});

  @override
  State<IndividualHomeView> createState() => _IndividualHomeViewState();
}

class _IndividualHomeViewState extends State<IndividualHomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndividualHomeController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SvgPicture.asset('assets/images/appLogo.svg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/notification_bell.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  Positioned(
                                    bottom: 12,
                                    right: 0,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10),
                        child: Text(
                          'December, 21 , 2023',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Today Events',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        child: HomeIndividualRemainderContainer(isRemainder: true,),
                      ),
                      HomeEventContainer(
                        text: 'Add event',
                        image: 'assets/images/add_event_home.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 17),
                        child: HomeEventContainer(
                          text: 'My calendar',
                          image: 'assets/images/my calender home container.png',
                        ),
                      ),
                      HomeEventContainer(
                        text: 'Due dates',
                        image: 'assets/images/due dates home container.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 17),
                        child: HomeEventContainer(
                          text: 'Profile',
                          image: 'assets/images/profile home container.png',
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ));
  }
}
