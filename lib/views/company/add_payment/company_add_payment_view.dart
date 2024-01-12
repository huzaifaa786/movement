import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:noobz/components/main_input.dart';
import 'package:noobz/components/priceinput.dart';
import 'package:noobz/components/topbbar.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/company/add_payment/company_add_payment_controller.dart';

class CompanyAddPaymentView extends StatefulWidget {
  const CompanyAddPaymentView({super.key});

  @override
  State<CompanyAddPaymentView> createState() => _CompanyAddPaymentViewState();
}

class _CompanyAddPaymentViewState extends State<CompanyAddPaymentView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyAddPaymentController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              title: TitleTopBar(
                name: 'Add payment',
                ontap: () {
                  Get.back();
                },
              ),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          children: [
                            Gap(40),
                            MainInput(
                              hintText: 'Payment name',
                            ),
                            Gap(12),
                            priceInput(
                              hintText: 'Payment amount',
                            ),
                            Gap(20),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(4294375158),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Payment dates',
                                      style: TextStyle(
                                          color: darkGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))))));
  }
}
