import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/home_events_container.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/company/home/company_home_controller.dart';

class CompanyHomeView extends StatefulWidget {
  const CompanyHomeView({super.key});

  @override
  State<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends State<CompanyHomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyHomeController>(
        builder: (controller) => Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SvgPicture.asset(
                                      'assets/images/appLogo.svg'),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Gap(28),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'December, 21 , 2023',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Gap(12),
                            Container(
                              height: 84,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade100,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                          // border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                'assets/images/Profile Image.png',
                                              ),
                                              radius: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text(
                                              'Adnoc',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(40),
                            HomeEventContainer(
                              ontap: () {
                                Get.offNamed(AppRoutes.addclient);
                              },
                              text: 'Add client',
                              image: 'assets/images/homeevent.svg',
                            ),
                            Gap(17),
                            HomeEventContainer(
                              ontap: () {
                                Get.offNamed(AppRoutes.allclient);
                              },
                              text: 'Existing clients',
                              image: 'assets/images/existing_client.svg',
                            ),
                            Gap(17),
                            HomeEventContainer(
                              text: 'Add event',
                              image: 'assets/images/homeevent.svg',
                            ),
                            Gap(17),
                            HomeEventContainer(
                              ontap: () {
                                Get.offNamed(AppRoutes.sale);
                              },
                              text: 'Sales',
                              image: 'assets/images/duedtaehomeevent.svg',
                            ),
                            Gap(17),
                            HomeEventContainer(
                              text: 'My calendar',
                              image: 'assets/images/calenderhomeevent.svg',
                            ),
                            Gap(17),
                            HomeEventContainer(
                              ontap: () {
                                Get.offNamed(AppRoutes.companyProfile);
                              },
                              text: 'Profile',
                              image: 'assets/images/profilehomeevent.svg',
                            ),
                            Gap(17),
                          ],
                        ))))));
  }
}
