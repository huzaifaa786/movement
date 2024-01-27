import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/allclient_box.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/models/company_model.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/company/client/allclient/allclient_controller.dart';

class AllclientView extends StatefulWidget {
  const AllclientView({super.key});

  @override
  State<AllclientView> createState() => _AllclientViewState();
}

class _AllclientViewState extends State<AllclientView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllClientController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                forceMaterialTransparency: true,
                title: TitleTopBar(
                  name: 'All Client',
                  ontap: () {
                    Get.back();
                  },
                ),
              ),
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${controller.compnyusers.length} Clients',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Gap(20),
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.compnyusers.length,
                            itemBuilder: (context, index) => AllclientBox(
                                  ontap: () {
                                    Get.offNamed(AppRoutes.clientinfo
                                     
                                    );
                                  },
                                  name: controller.compnyusers[index].username,
                                  type: controller.compnyusers[index].account_type,
                                )))
                    // AllclientBox(
                    //   ontap: () {
                    //     Get.offNamed(AppRoutes.clientinfo);
                    //   },
                    //   name: 'Ali Raza',
                    //   type: 'Petrol payment',
                    // ),
                    // AllclientBox(
                    //   name: 'Ali Raza',
                    //   type: 'Petrol payment',
                    // ),
                    // AllclientBox(
                    //   name: 'Ali Raza',
                    //   type: 'Petrol payment',
                    // ),
                    // AllclientBox(
                    //   name: 'Ali Raza',
                    //   type: 'Petrol payment',
                    // ),
                    // AllclientBox(
                    //   name: 'Ali Raza',
                    //   type: 'Petrol payment',
                    // ),
                  ],
                ),
              )),
            ));
  }
}
