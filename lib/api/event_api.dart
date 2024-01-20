import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/utils/string.dart';
import 'package:noobz/utils/ui_utils.dart';

class EventApi {
  storeEvent({
    event_name,
    event_type,
    payment_amount = null,
    payment_type = null,
    unit_name = null,
    unit_number = null,
    unit_type = null,
    schedule,
  }) async {
    var url = BASE_URL + 'event/create';
    var data;
    GetStorage box = GetStorage();
    var apiToken = box.read('api_token');
    var userID = box.read('user_id');
    schedule = jsonEncode(schedule);
    data = {
      'event_name': event_name,
      'event_type': event_type,
      'payment_amount': payment_amount,
      'payment_type': payment_type,
      'unit_name': unit_name,
      'unit_number': unit_number,
      'unit_type': unit_type,
      'schedule': schedule,
      'payment_status': 'pending',
      'api_token': apiToken,
      'user_id': userID,
      'company_id': null,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    if (!response['error']) {
      UiUtilites.successAlert(Get.context, 'Event saved Successfully');
    }
    return response;
  }

  Future<Map<String, dynamic>> getAllEvents() async {
    var url = BASE_URL + 'event/get';
    var data;
    GetStorage box = GetStorage();
    var apiToken = box.read('api_token');

    data = {
      'api_token': apiToken,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    return response;
  }
}
