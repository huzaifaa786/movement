// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noobz/api/due_dates_api.dart';
import 'package:noobz/utils/ui_utils.dart';

class DueDetailsController extends GetxController {
  static DueDetailsController instance = Get.find();
  final duedatesApi = DueDatesApi();
  GetStorage box = GetStorage();
  String? company_id = '';

  XFile paymentAttachment = XFile('');
  bool isSelected = false;
  String? trackingNumber = '';
  String? typeOfService = '';
  String? dueDate = '';
  String? amount = '';
  String? status = '';
  String? user_name = '';
  String? schedule_id = '';

  @override
  void onInit() {
    super.onInit();
    trackingNumber = Get.parameters['tracking_number'];
    typeOfService = Get.parameters['type_of_service'];
    dueDate = Get.parameters['event_date'];
    amount = Get.parameters['amount'];
    status = Get.parameters['status'];
    user_name = Get.parameters['user_name'];
    schedule_id = Get.parameters['schedule_id'];
    company_id = box.read('company_id');
    update();
  }

  Future<void> selectPaymentImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      paymentAttachment = image;
      isSelected = true;
      update();
    } else {
      paymentAttachment = XFile('');
      isSelected = false;
      update();
    }
  }

  Future<void> UploadPaymentImage() async {
    print('i am in the upload funciton ');
    String PaymentBase64 = '';

    if (paymentAttachment != null) {
      final PaymentBytes = await File(paymentAttachment.path).readAsBytes();
      PaymentBase64 = base64Encode(PaymentBytes);
    }
    var response =
        await duedatesApi.uploadPaymentAttachment(schedule_id, PaymentBase64);
    if (!response['error']) {
      Get.back();
      UiUtilites.successSnackbar('Payment attachment uploaded', 'Success!');
    } else {
      UiUtilites.errorSnackbar('could not upload attachment', 'Failue');
    }
  }
}
