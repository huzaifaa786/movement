import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/notification_container.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_controller.dart';
import 'package:noobz/views/individual/notification/individual_notification_controller.dart';

class IndividualNoficationView extends StatefulWidget {
  const IndividualNoficationView({super.key});

  @override
  State<IndividualNoficationView> createState() =>
      _IndividualNoficationViewState();
}

class _IndividualNoficationViewState extends State<IndividualNoficationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndividualNotificationController>(
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
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15,bottom: 40),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.9,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                return NotificationContainer(
                                  image:
                                      'assets/images/notification_upcoming_payment.png',
                                  notificationtext:
                                      'You have an upcoming payment to Adnoc on 27/Dec/2023',
                                );
                              }),
                        )
                        // NotificationContainer(
                        //   image:
                        //       'assets/images/notification_upcoming_payment.png',
                        //   notificationtext:
                        //       'You have an upcoming payment to Adnoc on 27/Dec/2023',
                        // ),
                        // NotificationContainer(
                        //   image:
                        //       'assets/images/notification_sussesfully_submitted.png',
                        //   notificationtext:
                        //       'You have successfully submitted proof of payment ,and its currently under review',
                        // ),
                        // NotificationContainer(
                        //   image:
                        //       'assets/images/notification_rental_payment.png',
                        //   notificationtext:
                        //       'You havea rental payment on 22/dec /2023',
                        // ),
                        // NotificationContainer(
                        //   image: 'assets/images/notification_missed.png',
                        //   notificationtext:
                        //       'You missed a payment on 22/dec /2023 to Adnoc',
                        // ),
                        // NotificationContainer(
                        //   image:
                        //       'assets/images/notification_payment_sussesful.png',
                        //   notificationtext:
                        //       'Adnoc accepted your  payment Successfuly',
                        // ),
                        // NotificationContainer(
                        //   image:
                        //       'assets/images/notification_reject_attachment.png',
                        //   notificationtext:
                        //       'Adnoc rejected your attachment  ,please Resubmit   the attachment.',
                        // ),

                        )))));
  }
}
