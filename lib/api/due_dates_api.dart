import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/utils/string.dart';

class DueDatesApi {
  Future<List<Map<String, dynamic>>> fetchDueDates() async {
    var url = BASE_URL + 'dueDates';
    GetStorage box = GetStorage();
    String api_token = box.read('api_token');
    var data = {'api_token': api_token};

    var response = await Api.execute(url: url, data: data);

    if (response != null &&
        response['error'] == false &&
        response['due_dates'] != null) {
      List<Map<String, dynamic>> dueDatesList =
          List<Map<String, dynamic>>.from(response['due_dates']);
      return dueDatesList;
    } else {
      return [];
    }
  }

  uploadPaymentAttachment(schedule_id, payment_attachment) async {
    var url = BASE_URL + 'upload/paymentAttachment';
    GetStorage box = GetStorage();
    String api_token = box.read('api_token');
    var data;
    data = {
      'api_token': api_token,
      'schedule_id': schedule_id,
      'payment_attachment': payment_attachment,
    };
    var response = await Api.execute(url: url, data: data);
    return response;
  }
}
