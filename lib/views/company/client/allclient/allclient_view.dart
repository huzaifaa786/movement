import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noobz/components/allclient_box.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/routes/app_routes.dart';

class AllclientView extends StatefulWidget {
  const AllclientView({super.key});

  @override
  State<AllclientView> createState() => _AllclientViewState();
}

class _AllclientViewState extends State<AllclientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  '235 Client',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )
              ],
            ),
            AllclientBox(
              ontap: (){ Get.offNamed(AppRoutes.clientinfo);},
              name: 'Ali Raza',
              type: 'Petrol payment',
            ),
            AllclientBox(
              name: 'Ali Raza',
              type: 'Petrol payment',
            ),
            AllclientBox(
              name: 'Ali Raza',
              type: 'Petrol payment',
            ),
            AllclientBox(
              name: 'Ali Raza',
              type: 'Petrol payment',
            ),
            AllclientBox(
              name: 'Ali Raza',
              type: 'Petrol payment',
            ),
          ],
        ),
      )),
    );
  }
}
