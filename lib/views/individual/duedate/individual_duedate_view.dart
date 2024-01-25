import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/duedatecontainer.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_controller.dart';

class IndividualDuedateView extends StatefulWidget {
  const IndividualDuedateView({super.key});

  @override
  State<IndividualDuedateView> createState() => _IndividualDuedateViewState();
}

class _IndividualDuedateViewState extends State<IndividualDuedateView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndividualDuedateController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              title: TitleTopBar(
                name: 'Due dates',
                ontap: () {
                  Get.back();
                },
              ),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: controller.dueDates.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var dueDate = controller.dueDates[index];
                        return Column(
                          children: [
                            DuedateContainer(
                              onTap: () {
                                Get.offNamed(AppRoutes.individualduadatedetail,
                                    parameters: {
                                      'event_date': dueDate['event_date'] ?? '',
                                      'type_of_service':
                                          dueDate['type_of_service'] ?? '',
                                      'amount': dueDate['amount'].toString(),
                                      'status': dueDate['payment_status'] ?? '',
                                      'tracking_number':
                                          dueDate['tracking_number'] ?? '',
                                          'user_name' : controller.user_name,
                                    });
                              },
                              image: 'assets/images/Profile Image.png',
                              name: controller.user_name,
                              amount: dueDate['amount'].toString(),
                              date: dueDate['reminder_date'],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                          ],
                        );
                      }),
                  // DuedateContainer(
                  //     onTap: () {
                  //       Get.offNamed(AppRoutes.individualduadatedetail);
                  //     },
                  //     image: 'assets/images/Profile Image.png',
                  //     name: 'Adnoc'),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15, bottom: 20),
                  //   child: Divider(
                  //     thickness: 1,
                  //     color: dividercolorduredate,
                  //   ),
                  // ),
                  // DuedateContainer(
                  //   image: 'assets/images/Profile Image.png',
                  //   name: 'Adnoc',
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15, bottom: 20),
                  //   child: Divider(
                  //     thickness: 1,
                  //     color: dividercolorduredate,
                  //   ),
                  // ),
                  // DuedateContainer(
                  //   image: 'assets/images/Profile Image.png',
                  //   name: 'Adnoc',
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15, bottom: 20),
                  //   child: Divider(
                  //     thickness: 1,
                  //     color: dividercolorduredate,
                  //   ),
                  // ),
                ],
              ),
            )))));
  }
}
