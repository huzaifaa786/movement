import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/clientinfo.dart';
import 'package:noobz/components/clientinfobutton.dart';
import 'package:noobz/components/detail.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';

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
                  ClientinfoButton(),
                  Gap(12),
                  Row(
                    children: [
                      Text(
                        'All Due details',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Gap(10),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(19))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Due type',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Due Type',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'view',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text('')
                      ],
                    ),
                  ),
                  DetailCard()
                ]))));
  }
}
