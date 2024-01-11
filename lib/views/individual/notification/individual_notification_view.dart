import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/notification_container.dart';
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
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          children: [
                            IndividualProfileAppBar(
                              name: 'Notification',

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: NotificationContainer(
                                image:
                                    'assets/images/notification_upcoming_payment.png',
                                notificationtext:
                                    'You have an upcoming payment to Adnoc on 27/Dec/2023',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                            NotificationContainer(
                              image:
                                  'assets/images/notification_sussesfully_submitted.png',
                              notificationtext:
                                  'You have successfully submitted proof of payment ,and its currently under review',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                            NotificationContainer(
                              image:
                                  'assets/images/notification_rental_payment.png',
                              notificationtext:
                                  'You havea rental payment on 22/dec /2023',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                            NotificationContainer(
                              image: 'assets/images/notification_missed.png',
                              notificationtext:
                                  'You missed a payment on 22/dec /2023 to Adnoc',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                            NotificationContainer(
                              image:
                                  'assets/images/notification_payment_sussesful.png',
                              notificationtext:
                                  'Adnoc accepted your  payment Successfuly',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                            NotificationContainer(
                              image:
                                  'assets/images/notification_reject_attachment.png',
                              notificationtext:
                                  'Adnoc rejected your attachment  ,please Resubmit   the attachment.',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 32),
                              child: Divider(
                                thickness: 1,
                                color: dividercolorduredate,
                              ),
                            ),
                          ],
                        ))))));
  }
}
