import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/components/clientinfo.dart';
import 'package:noobz/components/clientinfobutton.dart';
import 'package:noobz/components/topbbar.dart';

class ClientInfo extends StatefulWidget {
  const ClientInfo({super.key});

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
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
                child: Column(children: [
                  ClientInfoBox(
                    name: 'Ali Raza',
                    type: 'Petrol Payment',
                  ),
                  ClientinfoButton()
                ]))));
  }
}
